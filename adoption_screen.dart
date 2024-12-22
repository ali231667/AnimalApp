import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safe_paws_app/animal_detail_screen.dart';
import 'package:safe_paws_app/main.dart';
import 'package:safe_paws_app/animal.dart';
import 'package:safe_paws_app/profile_screen.dart';
import 'package:safe_paws_app/add_pet_screen.dart'; // Import the AddPetScreen



class AdoptionScreen extends StatefulWidget {
  final Function menuCallback;
  AdoptionScreen({required this.menuCallback});

  @override
  _AdoptionScreenState createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  int selectedAnimalIconIndex = 0;
  bool isContainerClicked = false;

  TextEditingController _searchController = TextEditingController();
  List<Animal> animals = [
    Animal(
      name: 'Buddy',
      scientificName: 'Golden retriever',
      age: 8.0,
      distanceToUser: '3.6 km',
      isFemale: false,
      imageUrl: 'assets/file.png',
      backgroundColor: Color.fromRGBO(203, 213, 216, 1.0),
      type: 'Dog',
    ),
    Animal(
      name: 'Jolly',
      scientificName: 'Russell Terrier',
      age: 8.0,
      distanceToUser: '3.6 km',
      isFemale: false,
      imageUrl: 'assets/jolly.png',
      backgroundColor: Color.fromRGBO(203, 213, 216, 1.0),
      type: 'Dog',
    ),
    Animal(
      name: 'Tigress',
      scientificName: 'Cat',
      age: 0.2,
      distanceToUser: '3.6 km',
      isFemale: false,
      imageUrl: 'assets/tigress.png',
      backgroundColor: Color.fromRGBO(203, 213, 216, 1.0),
      type: 'Cat',
    ),
  ];

  List<Animal> filteredAnimals = [];
  int _selectedIndex = 0; // Index for the bottom navigation bar

  List<String> animalTypes = ['Cats', 'Dogs', 'Parrots', 'Fish'];
  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
  ];

  @override
  void initState() {
    super.initState();
    filteredAnimals = animals;

    // Add listener to the search controller
    _searchController.addListener(() {
      filterAnimals();
    });
  }

  // Function to filter animals based on search query
  void filterAnimals() {
    String query = _searchController.text.trim().toLowerCase();

    setState(() {
      filteredAnimals = animals.where((animal) {
        // Check if either the name or scientific name matches the query
        return animal.name.toLowerCase().contains(query) ||
            animal.scientificName.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to respective screens
    switch (index) {
      case 0:
      // Navigate to Home Screen
        break;
      case 1:
      // Navigate to Add Pet Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPetScreen(), // Navigate to AddPetScreen
          ),
        );
        break;
      case 2:
      // Navigate to Profile Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(), // Assuming ProfileScreen is already created
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Material(
        color: Color.fromRGBO(40, 90, 140, 1.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Icon(FontAwesomeIcons.bars, color: Colors.white),
                      onTap: () {
                        widget.menuCallback?.call();
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '   Safe Paws ',
                              style: TextStyle(
                                fontFamily: 'Cursive',
                                fontStyle: FontStyle.normal,
                                letterSpacing: 2.0,
                                wordSpacing: 4.0,
                                fontWeight: FontWeight.w900,
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.lightBlueAccent.shade100.withOpacity(0.5),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11.0,
                            vertical: 12.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.search,
                                    color: Colors.grey),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Search pets',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Icon(FontAwesomeIcons.filter,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(40, 90, 140, 1.0),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: animalTypes.length,
                            itemBuilder: (context, index) {
                              return buildAnimalIcon(index);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 10.0),
                            itemCount: filteredAnimals.length,
                            itemBuilder: (context, index) {
                              final animal = filteredAnimals[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AnimalDetailScreen(
                                            animal: animal);
                                      },
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20.0,
                                    right: 14.0,
                                    left: 14.0,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                        elevation: 4.0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: deviceWidth * 0.3,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          animal.name,
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                        Icon(
                                                          animal.isFemale
                                                              ? FontAwesomeIcons
                                                              .venus
                                                              : FontAwesomeIcons
                                                              .mars,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      animal.scientificName,
                                                      style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      '${animal.age} years old',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Material(
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                            elevation: 4.0,
                                            child: Container(
                                              height: 200.0,
                                              width: deviceWidth * 0.30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20.0),
                                                color: animal.backgroundColor,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    15.0),
                                                child: Center(
                                                  child: Hero(
                                                    tag: animal.name,
                                                    child: Image.asset(
                                                      animal.imageUrl,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Pet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildAnimalIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnimalIconIndex = index;
        });
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: selectedAnimalIconIndex == index
              ? Colors.white
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          animalIcons[index],
          color: selectedAnimalIconIndex == index
              ? Colors.blueAccent
              : Colors.white,
        ),
      ),
    );
  }
}
