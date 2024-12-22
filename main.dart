import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_paws_app/menu_frame.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with error handling
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(MyApp());
}

Color mainColor = Color.fromRGBO(50, 80, 100, 1.0);
Color startingColor = Color.fromRGBO(55, 115, 180, 1.0);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Paws App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      home: AuthenticationWrapper(), // Decides which screen to show based on user authentication
    );
  }
}

/// This widget checks whether the user is logged in or not
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading spinner while waiting for authentication state to be determined
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // If there is an error with the snapshot
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong: ${snapshot.error}"));
        }

        // If the user is logged in, navigate to MenuFrame
        if (snapshot.hasData) {
          return MenuFrame();
        }

        // If not logged in, show LoginScreen
        return LoginScreen();
      },
    );
  }
}
