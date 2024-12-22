import 'package:flutter/material.dart';

class ComplainScreen extends StatefulWidget {
  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final _complaintController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(  // Adding scrollable view
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.report_problem, size: 80, color: Colors.orangeAccent),
              SizedBox(height: 20),
              Text(
                'File a Complaint',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Have an issue? Let us know so we can resolve it.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _complaintController,
                      decoration: InputDecoration(
                        labelText: 'Your Complaint',
                        hintText: 'Describe the issue...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,  // Makes the field multiline
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your complaint';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Simulate complaint submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Complaint Submitted!')),
                          );
                          // Clear the text field after submission
                          _complaintController.clear();
                        }
                      },
                      child: Text('Submit Complaint'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
