import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/home_screen.dart';
import 'package:flutter_quiz_app/screens/profile_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/screens/login_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/subject_screen.dart';
// import 'screens/question_screen.dart';
// import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FQuizz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),

        // GetPage(name: '/questions', page: () => QuestionScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
    );
  }
}
