import 'package:flutter/material.dart';
import 'package:zacro_tribe/widgets/my_feed_widget.dart';

class TraderProfilePage extends StatefulWidget {
  const TraderProfilePage({super.key});

  @override
  State<TraderProfilePage> createState() => _TraderProfilePageState();
}

class _TraderProfilePageState extends State<TraderProfilePage> {
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset('assets/icons/ic_more.png', height: 24, width: 24,),
          ),
        ],
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Kevin Jones", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),),
                  Row(
                    children: [
                      const Text("quyrhryf...1234dhdy", style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                      IconButton(onPressed: () {}, icon: Image.asset("assets/icons/ic_copy_clipboard.png", height: 16, width: 16, fit: BoxFit.fill,)),
                    ],
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2K", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text("Following", style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                    child: VerticalDivider(
                      width: 2,
                      thickness: 1,
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3K", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text("Followers", style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                    child: VerticalDivider(
                      width: 2,
                      thickness: 1,
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3K", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text("Earnings", style: TextStyle(fontSize: 12),),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                    child: VerticalDivider(
                      width: 2,
                      thickness: 1,
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("42", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text("Likes", style: TextStyle(fontSize: 12),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              const Divider(
                height: 1,
                color: Color(0xFFD9D9D9),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("Posts (24)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
              ),
              ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const MyFeedWidget(pfImg: 'assets/images/profile.png', bnImg: 'assets/images/feed_bg1.png', name: 'Kevin Jones', desc: 'The Chill Guy meme coin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
