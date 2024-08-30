import 'package:flutter/material.dart';
import '../widgets/student_submission_item.dart';

class TeacherCourseScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Piano Lessons',
      'time': 'Monday 10:00 AM',
      'students': [
        {'name': 'John Doe', 'file': 'piano_practice.mp3'},
        {'name': 'Jane Smith', 'file': 'piano_piece.mp3'},
      ]
    },
    {
      'title': 'Guitar Lessons',
      'time': 'Wednesday 3:00 PM',
      'students': [
        {'name': 'Tom Lee', 'file': 'guitar_riff.mp3'},
        {'name': 'Anna Taylor', 'file': 'guitar_solo.mp3'},
      ]
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
                  Text('Time: ${courses[index]['time']}'),
                  SizedBox(height: 10),
                  Column(
                    children: (courses[index]['students'] as List).map((student) {
                      return StudentSubmissionItem(
                        studentName: student['name'],
                        fileName: student['file'],
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