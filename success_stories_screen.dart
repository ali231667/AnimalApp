import 'package:flutter/material.dart';

class SuccessStoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Stories'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 80, color: Colors.purple),
              SizedBox(height: 20),
              Text(
                'Success Stories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Read inspiring stories of pets finding loving homes!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Feature Coming Soon!')),
                  );
                },
                child: Text('Read Stories'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
