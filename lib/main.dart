import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/ui/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Home()
      ),
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
    );
  }
}
