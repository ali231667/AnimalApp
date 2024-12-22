import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:safe_paws_app/login_screen.dart'; // Import the LoginScreen class
import 'package:safe_paws_app/adoption_screen.dart'; // Import the AdoptionScreen
import 'package:safe_paws_app/foster_screen.dart'; // Import the FosterScreen
import 'package:safe_paws_app/surrender_screen.dart'; // Import the SurrenderScreen
import 'package:safe_paws_app/complain_screen.dart'; // Import the ComplainScreen
import 'package:safe_paws_app/awareness_screen.dart'; // Import the AwarenessScreen
import 'package:safe_paws_app/success_stories_screen.dart'; // Import the SuccessStoriesScreen
import 'main.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Adopt a pet',
    'Foster a pet',
    'Surrender a pet',
    'Complains',
    'Awareness',
    'Success Stories',
  ];

  List<IconData> icons = [
    FontAwesomeIcons.paw,
    FontAwesomeIcons.home,
    FontAwesomeIcons.shield,
    FontAwesomeIcons.message,
    FontAwesomeIcons.lightbulb,
    FontAwesomeIcons.star,
  ];

  // List of corresponding screens for each menu item
  List<Widget> menuScreens = [
    AdoptionScreen(
      menuCallback: () {
        print("Returning from AdoptionScreen");
      },
    ), // Screen for 'Adopt a pet'
    FosterScreen(), // Screen for 'Foster a pet'
    SurrenderScreen(), // Screen for 'Surrender a pet'
    ComplainScreen(), // Screen for 'Complains'
    AwarenessScreen(), // Screen for 'Awareness'
    SuccessStoriesScreen(), // Screen for 'Success Stories'
  ];

  // Logout function
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Redirect to LoginScreen
      );
    } catch (e) {
      print("Error logging out: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error logging out")),
      );
    }
  }

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
        });
        // Navigate to the selected screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => menuScreens[index]),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          children: <Widget>[
            Icon(
              icons[index],
              color: selectedMenuIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            SizedBox(width: 16.0),
            Text(
              menuItems[index],
              style: TextStyle(
                color: selectedMenuIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [startingColor, mainColor],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 24.0,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Muhammad Junaid Ali',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          ' Active status',
                          style: TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: menuItems
                      .asMap()
                      .entries
                      .map((mapEntry) => buildMenuRow(mapEntry.key))
                      .toList(),
                ),
                GestureDetector(
                  onTap: () {
                    // Show confirmation dialog before logging out
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Log out"),
                          content: Text("Are you sure you want to log out?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                                _logout(); // Perform logout
                              },
                              child: Text("Log out"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
