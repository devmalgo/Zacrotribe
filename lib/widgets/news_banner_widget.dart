import 'package:flutter/material.dart';

class NewsBannerWidget extends StatelessWidget {

  final String imgPath;

  const NewsBannerWidget({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }
}
