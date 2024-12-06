import 'package:flutter/material.dart';
import 'package:zacro_tribe/widgets/my_feed_widget.dart';

class YourFeedPage extends StatefulWidget {
  const YourFeedPage({super.key});

  @override
  State<YourFeedPage> createState() => _YourFeedPageState();
}

class _YourFeedPageState extends State<YourFeedPage> with SingleTickerProviderStateMixin {

  late TabController feedTabController;

  @override
  void initState() {
    feedTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    feedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: feedTabController,
          indicatorColor: const Color(0xFF4A90E2),
          indicatorWeight: 4,
          tabs: const [
            Tab(text: "For You",),
            Tab(text: "Trader",),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(
        controller: feedTabController,
        children: [
          buildNewsList(),
          buildTraderList(),
        ],
      ),
    );
  }

  Widget buildNewsList() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: MyFeedWidget(
            pfImg: "assets/images/profile.png",
            bnImg: "assets/images/feed_bg1.png",
            name: "Don Norman",
            desc: "Peter Schiff Believes That The Price Of Bitcoin Is Going To Slide To \$54,000 In The Short Term",
          ),
        );
      },
    );
  }

  Widget buildTraderList() {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/profile.png", height: 35, width: 35, fit: BoxFit.cover,),
                  ),
                );
              }),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Don Norman", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
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
              );
            },
          ),
        ),
      ],
    );
  }

}
