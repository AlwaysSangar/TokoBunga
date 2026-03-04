import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const FloristApp());
}

class FloristApp extends StatelessWidget {
  const FloristApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Florist App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomePage(),
    );
  }
}
