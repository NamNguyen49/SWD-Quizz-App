// import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/firebase_options.dart';
import 'package:flutter_quiz_app/screens/home_screen.dart';
import 'package:flutter_quiz_app/screens/profile_screen.dart';
import 'package:flutter_quiz_app/screens/register_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

// void main() {
//   runApp(MyApp());
// }
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(options: Dè);
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FUS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        // GetPage(name: '/', page: () => RegisterScreen()),
        GetPage(name: '/', page: () => LoginScreen()),

        // GetPage(name: '/questions', page: () => QuestionScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
    );
  }
}
