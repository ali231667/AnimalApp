import 'package:flutter/material.dart';

void main() {
  runApp(SafePawsApp());
}

class SafePawsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafePawsScreen(),
    );
  }
}

class SafePawsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(149, 183, 251, 1.0), // Ensure background color is set here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300, // Fixed width
              height: 300, // Fixed height
              child: Image.asset(
                'assets/home.png', // Ensure this path is correct and the image is in the assets folder
                fit: BoxFit.contain, // Adjust the image inside the container
              ),
            ),
            SizedBox(height: 20), // Adjusted spacing
            Text(
              'They need you',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Cursive',
                fontStyle: FontStyle.normal,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w900,
                color: Colors.white, // Adjusted text color for better contrast
              ),
            ),
            SizedBox(height: 10), // Adjusted spacing
            Text(
              'for a chance to live again',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cursive',
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
