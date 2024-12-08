import 'package:ex/screens/demo/demo_screen.dart';
import 'package:ex/screens/home/Create_Task_Screens.dart';
import 'package:ex/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
