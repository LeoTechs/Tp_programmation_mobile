import 'package:flutter/material.dart';
import 'MyOnboardingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartChop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyOnboardingPage(),
    );
  }
}
