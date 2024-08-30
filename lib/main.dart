import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/student_dashboard_screen.dart';
import 'screens/course_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MusicLearnApp());
}

class MusicLearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Learn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/student_dashboard': (context) => StudentDashboardScreen(),
        '/courses': (context) => CourseScreen(),
      },
    );
  }
}