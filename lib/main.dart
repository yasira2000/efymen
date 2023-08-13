import 'package:flutter/material.dart';
import './screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFFC400),
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.black,
          secondary: Color(0xFFFFEBAA),
        ),
      ),
    );
  }
}
