import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Ini Halaman Chat",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}


