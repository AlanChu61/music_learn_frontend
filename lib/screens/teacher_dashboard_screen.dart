import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherDashboardScreen extends StatefulWidget {
  @override
  _TeacherDashboardScreenState createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  String name = '';
  String email = '';
  String role = '';
  String instrument = '';
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTeacherProfile();
  }

  // Fetch teacher profile data from the API
  Future<void> fetchTeacherProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        setState(() {
          isLoading = false;
          errorMessage = 'Token not found. Please log in again.';
        });
        return;
      }

      final response = await http.get(
        Uri.parse('http://192.168.1.72:8000/me'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          name = data['name'];
          email = data['email'];
          role = data['role'];
          instrument = data['instrument'] ?? 'N/A';
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
        title: Text('Teacher Dashboard'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
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
                            'https://www.example.com/path-to-placeholder-image'), // Placeholder image
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Name: $name',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Email: $email',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Role: $role',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Instrument: $instrument',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/teacher_courses');
                        },
                        child: Text('Go to Courses'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
