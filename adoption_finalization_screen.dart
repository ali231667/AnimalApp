import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safe_paws_app/animal.dart';

class AdoptionFinalizationScreen extends StatelessWidget {
  final Animal animal;

  // Constructor to receive the animal object
  AdoptionFinalizationScreen({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption Finalization'),
        backgroundColor: Color.fromRGBO(40, 90, 140, 1.0),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display animal details (without breed)
            Text(
              'Name: ${animal.name}',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Age: ${animal.age} years old',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Scientific Name: ${animal.scientificName}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              animal.isFemale ? 'Gender: Female' : 'Gender: Male',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20.0),

            // Confirmation Text and Button
            Text(
              'Are you sure you want to adopt ${animal.name}?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),

            // Confirm Adoption Button
            ElevatedButton(
              onPressed: () {
                // Handle final adoption action here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Adopted!'),
                      content: Text('${animal.name} has been adopted successfully.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context); // Go back to the previous screen
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(40, 90, 140, 1.0), // Button color
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text(
                'Confirm Adoption',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
