import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("Coming Soon", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
    );
  }
}
