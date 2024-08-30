import 'package:flutter/material.dart';

class StudentSubmissionItem extends StatelessWidget {
  final String studentName;
  final String fileName;

  StudentSubmissionItem({required this.studentName, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(studentName),
      subtitle: Text(fileName),
      trailing: ElevatedButton(
        onPressed: () {
          // Implement file download or playback functionality here
        },
        child: Text('Download'),
      ),
    );
  }
}