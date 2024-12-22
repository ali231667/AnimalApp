import 'package:flutter/material.dart';

class AwarenessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awareness'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(  // Added SingleChildScrollView to handle more content
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,  // Aligns content to the start of the screen
            children: [
              Icon(Icons.lightbulb, size: 80, color: Colors.green),
              SizedBox(height: 20),
              Text(
                'Raise Awareness',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Spread the word about responsible pet ownership and animal welfare. '
                    'By educating ourselves and others, we can create a better world for animals.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              Text(
                'Why It Matters',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Responsible pet ownership includes providing proper care, nutrition, and companionship. '
                    'It ensures that pets live healthy and fulfilling lives. Animal welfare is also about protecting animals '
                    'from cruelty and ensuring their rights. Every pet deserves a loving home, proper care, and a safe environment.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'How You Can Help',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'You can contribute by adopting pets from shelters, supporting animal welfare organizations, '
                    'and educating others about responsible pet ownership. Volunteer at your local animal shelter or donate to '
                    'organizations working to protect animals from cruelty and neglect.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'The Importance of Education',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Education plays a crucial role in improving the welfare of animals. Teaching children and adults about '
                    'responsible pet care, wildlife protection, and the importance of spaying and neutering can reduce the number of '
                    'stray and abandoned animals. It is vital that we educate future generations to ensure a better world for our furry friends.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'Together We Can Make a Difference',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'By supporting responsible pet ownership and animal welfare initiatives, we can make a real difference. '
                    'Together, we can create a world where every animal is treated with kindness, respect, and compassion.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
