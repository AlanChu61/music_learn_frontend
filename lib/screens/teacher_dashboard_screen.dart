import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
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
              'Name: Teacher Name', // Replace with actual teacher name
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: teacher@example.com', // Replace with actual email
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