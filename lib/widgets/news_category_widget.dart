import 'dart:ui';

import 'package:flutter/material.dart';

class NewsCategoryWidget extends StatelessWidget {

  final String title;
  final String imgUrl;

  const NewsCategoryWidget({super.key, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.network(imgUrl, height: 50, width: 150, fit: BoxFit.cover,),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              height: 50,
              width: 150,
              color: Colors.black.withOpacity(0),
            ),
          ),
          Center(
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
