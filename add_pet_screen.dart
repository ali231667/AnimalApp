import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scientificNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  bool _isFemale = true; // Default gender
  String? _selectedType; // Nullable dropdown value
  final List<String> animalTypes = ['Cats', 'Dogs', 'Parrots', 'Fish']; // Pet types

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Pet Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a pet name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _scientificNameController,
                decoration: const InputDecoration(labelText: 'Scientific Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a scientific name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age (in years)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text('Gender:'),
                  Radio<bool>(
                    value: true,
                    groupValue: _isFemale,
                    onChanged: (value) {
                      setState(() {
                        _isFemale = value!;
                      });
                    },
                  ),
                  const Text('Female'),
                  Radio<bool>(
                    value: false,
                    groupValue: _isFemale,
                    onChanged: (value) {
                      setState(() {
                        _isFemale = value!;
                      });
                    },
                  ),
                  const Text('Male'),
                ],
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedType = newValue;
                  });
                },
                items: animalTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Pet Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a pet type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pop(context, {
                      'name': _nameController.text,
                      'scientificName': _scientificNameController.text,
                      'age': double.parse(_ageController.text),
                      'isFemale': _isFemale,
                      'type': _selectedType,
                    });
                  }
                },
                child: const Text('Save Pet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
