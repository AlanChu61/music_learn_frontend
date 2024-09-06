import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/student_submission_item.dart';

class StudentCourseScreen extends StatefulWidget {
  @override
  _StudentCourseScreenState createState() => _StudentCourseScreenState();
}

class _StudentCourseScreenState extends State<StudentCourseScreen> {
  List<Map<String, dynamic>> courses = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    // Check if the token is available
    if (token.isEmpty) {
      setState(() {
        isLoading = false;
        errorMessage = 'Token not found. Please log in again.';
      });
      return;
    }

    // Make the API call to fetch courses
    final response = await http.get(
      Uri.parse('http://192.168.1.72:8000/courses'), // Replace with your API URL
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    // Handle the response
    if (response.statusCode == 200) {
      List<dynamic> courseData = jsonDecode(response.body);
      setState(() {
        courses = courseData.map((data) => data as Map<String, dynamic>).toList();
        isLoading = false;
      });
    } else {
      // Handle error if fetching courses failed
      setState(() {
        errorMessage = 'Failed to load courses. Please try again later.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Courses'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courses[index]['title'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('Time: ${courses[index]['schedule']}'),
                            SizedBox(height: 10),
                            Column(
                              children: (courses[index]['submissions'] as List).map((submission) {
                                return StudentSubmissionItem(
                                  studentName: submission['user_name'], // Display user_name instead of user_id
                                  fileName: submission['file_url'], // File name
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}