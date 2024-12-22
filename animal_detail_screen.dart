import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safe_paws_app/adoption_finalization_screen.dart'; // Import the finalization screen
import 'package:safe_paws_app/animal.dart';

class AnimalDetailScreen extends StatefulWidget {
  final Animal animal;

  AnimalDetailScreen({required this.animal});

  @override
  _AnimalDetailScreenState createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  bool _showAppBar = false;
  bool _isAdopted = false; // This will track if the pet is adopted

  void _toggleAppBar() {
    setState(() {
      _showAppBar = !_showAppBar;
    });
  }

  // Updated _adoptPet method with confirmation dialog
  void _adoptPet() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Adoption'),
          content: Text('Are you sure you want to adopt ${widget.animal.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _finalizeAdoption(); // Proceed to finalize the adoption
              },
              child: Text('Adopt Now'),
            ),
          ],
        );
      },
    );
  }

  // Method to finalize the adoption and navigate to the AdoptionFinalizationScreen
  void _finalizeAdoption() {
    setState(() {
      _isAdopted = true; // Mark the pet as adopted
    });

    // Navigate to the Adoption Finalization Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdoptionFinalizationScreen(animal: widget.animal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: _toggleAppBar, // Toggles AppBar visibility
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.5,
                      color: Color.fromRGBO(203, 213, 216, 1.0),
                    ),
                    Image.asset(
                      'assets/file.png', // Dynamically sets the image
                      height: screenHeight * 0.5,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
                    color: Color.fromRGBO(55, 115, 180, 1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: AssetImage('assets/profile.jpg'),
                                ),
                                SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sam David',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Owner',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              'May 25, 2024',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'My job requires moving to another country. So it is difficult to carry buddy everywhere along with me, that\'s why I am finding a new home for buddy.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.06),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 4.0,
                        color: Color.fromRGBO(40, 90, 140, 1.0),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(FontAwesomeIcons.heart, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 24.0),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 4.0,
                          color: Color.fromRGBO(40, 90, 140, 1.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: _isAdopted
                                ? Text(
                              'Adopted!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            )
                                : GestureDetector(
                              onTap: _adoptPet,
                              child: Text(
                                'Adopt me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Visibility(
                visible: _showAppBar,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black54),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.share, color: Colors.black54),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: 10,
              right: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 6.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
                    height: 140.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 90, 140, 0.9),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.animal.name,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              widget.animal.isFemale
                                  ? FontAwesomeIcons.venus
                                  : FontAwesomeIcons.mars,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.animal.scientificName,
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${widget.animal.age} years old',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapLocation,
                              color: Colors.black54,
                              size: 14.0,
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
