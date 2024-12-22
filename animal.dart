import 'package:flutter/material.dart'; // <-- Add this import to use Color

class Animal {
  final String name;
  final String scientificName;
  final double age;
  final String distanceToUser;
  final bool isFemale;
  final String imageUrl;
  final Color backgroundColor; // Color class is used here
  final String type;  // <-- Required parameter

  Animal({
    required this.name,
    required this.scientificName,
    required this.age,
    required this.distanceToUser,
    required this.isFemale,
    required this.imageUrl,
    required this.backgroundColor,
    required this.type,  // <-- Required parameter in the constructor
  });
}
