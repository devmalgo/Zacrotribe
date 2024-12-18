import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset('assets/icons/ic_back_arrow.png', height: 24, width: 24,),
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("Coming Soon", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
    );
  }
}
