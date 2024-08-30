import 'package:flutter/material.dart';

class StudentDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: Padding(
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
              'Name: Student Name', // Replace with actual student name
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: student@example.com', // Replace with actual email
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/courses');
              },
              child: Text('Go to Courses'),
            ),
            ElevatedButton(
              onPressed: () {
                // Show student info or perform other actions
              },
              child: Text('View Student Info'),
            ),
          ],
        ),
      ),
    );
  }
}