import 'package:flutter/material.dart';
import '../widgets/course_item.dart';

class CourseScreen extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Piano Lessons',
      'time': 'Monday 10:00 AM',
      'teacher': 'Mr. Smith',
    },
    {
      'title': 'Guitar Lessons',
      'time': 'Wednesday 3:00 PM',
      'teacher': 'Ms. Johnson',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseItem(
            title: courses[index]['title']!,
            time: courses[index]['time']!,
            teacher: courses[index]['teacher']!,
          );
        },
      ),
    );
  }
}