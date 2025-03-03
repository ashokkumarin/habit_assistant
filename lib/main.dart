import 'package:flutter/material.dart';
import 'package:myhabitassistant/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 18, 70, 148)),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Habit Assistant'),
    );
  }
}

