import 'package:flutter/material.dart';
import 'package:smartchop/pages/ChatbotPage.dart';
import 'package:smartchop/pages/MealsPage.dart';
import 'package:smartchop/pages/ProfilePage.dart';
import 'package:smartchop/pages/StatisticsPage.dart';
import 'package:smartchop/pages/addMeal.dart';
import 'package:smartchop/pages/nav/BottomNavigationBar.dart';
import 'package:smartchop/pages/auth/myLoginPage.dart';
import 'package:smartchop/pages/auth/myRegistrationPage.dart';
import 'pages/onboarding/MyOnboardingPage.dart';
import 'pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCxunnfPlogbRZ-7EFWu9GFtCwCZPJka4c",
      appId: "1:384498868191:android:8be9cf9e13e44f54de2e6a",
      messagingSenderId: "smartchop",
      projectId: 'smartchop-c9125',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register': (context) => MyRegistrationPage(),
        '/login': (context) => MyLoginPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(
              userId: '',
            ),
        '/meals': (context) => MealsPage(),
        '/analytics': (context) => StatisticsPage(),
        '/chatbot': (context) => ChatbotPage(),
        '/add-meal': (context) => AddMealPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'SmartChop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyOnboardingPage(),
    );
  }
}
