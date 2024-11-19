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
                radius: 14,
                backgroundImage: AssetImage(widget.pfImg),
              ),
              const SizedBox(width: 10,),
              Text(widget.name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
              const SizedBox(width: 5,),
              const Text("@jnd1er", style: TextStyle(fontSize: 10, color: Color(0xFF5B7083)),),
              const SizedBox(width: 5,),
              const Text("1 Min", style: TextStyle(fontSize: 10, color: Color(0xFF5B7083)),),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xFF4A90E2),
                ),
                child: const Text("Follow", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Column(
              children: [
                Text(widget.desc, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                const SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(widget.bnImg, height: 105, width: double.infinity, fit: BoxFit.cover,),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.comment, color: Colors.grey, size: 20,)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.repeat, color: Colors.grey, size: 20,)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.grey, size: 20,)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: Colors.grey, size: 20,)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
