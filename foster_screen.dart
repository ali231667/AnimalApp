import 'package:flutter/material.dart';

class FosterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foster a Pet'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.pets, size: 100, color: Colors.blueAccent),
              SizedBox(height: 20),
              Text(
                'Welcome to the Foster a Pet Screen!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Here you can find pets in need of a temporary home and make a difference in their lives.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Foster Guide Section
              Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.blueAccent),
                  title: Text(
                    'Foster Guide',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Learn how to provide care for foster pets.'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Foster Guide Coming Soon!')),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Pet List Section
              Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.list_alt, color: Colors.blueAccent),
                  title: Text(
                    'View Available Pets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Browse pets looking for foster homes.'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Pet List Feature Coming Soon!')),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Get Involved Section
              Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.volunteer_activism, color: Colors.blueAccent),
                  title: Text(
                    'Get Involved',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Join our community of foster families.'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Get Involved Feature Coming Soon!')),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),

              // Call-to-Action Button
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Thank you for your interest in fostering!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  'Become a Foster Parent',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
