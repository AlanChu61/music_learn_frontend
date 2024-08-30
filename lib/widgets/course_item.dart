import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  final String title;
  final String time;
  final String teacher;

  CourseItem({required this.title, required this.time, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Time: $time'),
            Text('Teacher: $teacher'),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement file upload functionality here
                  },
                  child: Text('Upload Music'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Implement delete functionality here
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}