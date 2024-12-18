import 'package:flutter/material.dart';

class MyFeedWidget extends StatefulWidget {

  final String pfImg;
  final String bnImg;
  final String name;
  final String desc;

  const MyFeedWidget({super.key, required this.pfImg, required this.bnImg, required this.name, required this.desc});

  @override
  State<MyFeedWidget> createState() => _MyFeedWidgetState();
}

class _MyFeedWidgetState extends State<MyFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.pfImg),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),),
                  const SizedBox(height: 8,),
                  const Text("2hrs ago", style: TextStyle(fontSize: 10, color: Color(0xFF606060)),),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.desc, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
              const SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(widget.bnImg, height: 125, width: double.infinity, fit: BoxFit.cover,),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/ic_like_btn.png", height: 16, width: 16, fit: BoxFit.contain,),
                      const Text("245", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF7C7C7C)),),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/ic_cmnt.png", height: 16, width: 16, fit: BoxFit.contain,),
                      const Text("27", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF7C7C7C)),),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/ic_share_link.png", height: 16, width: 16, fit: BoxFit.contain,),
                      const Text("12", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF7C7C7C)),),
                    ],
                  ),
                  Image.asset("assets/icons/ic_save_disable.png", height: 16, width: 16, fit: BoxFit.contain,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
