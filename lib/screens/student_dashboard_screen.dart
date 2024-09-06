import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StudentDashboardScreen extends StatefulWidget {
  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  String name = '';
  String email = '';
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchStudentProfile();
  }

  // Function to fetch student profile data from the API
  Future<void> fetchStudentProfile() async {
    try {
      // Retrieve stored JWT token
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        setState(() {
          isLoading = false;
          errorMessage = 'Token not found. Please log in again.';
        });
        return;
      }

      // Make a GET request to the /me endpoint with Authorization header
      final response = await http.get(
        Uri.parse('http://192.168.1.72:8000/me'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Update the UI with the fetched profile data
        setState(() {
          name = data['name'];
          email = data['email'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load profile. Error: ${response.body}';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred: $error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://www.example.com/path-to-placeholder-image'), // Placeholder image URL
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Name: $name', // Display fetched student name
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Email: $email', // Display fetched student email
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/student_courses'); 
                        },
                        child: Text('Go to Courses'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
