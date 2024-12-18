import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/traders/traders_list_page.dart';

import '../../widgets/my_feed_widget.dart';

class TraderTabPage extends StatefulWidget {
  const TraderTabPage({super.key});

  @override
  State<TraderTabPage> createState() => _TraderTabPageState();
}

class _TraderTabPageState extends State<TraderTabPage> with SingleTickerProviderStateMixin {

  late TabController traderTabController;

  @override
  void initState() {
    traderTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    traderTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traders", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),),
        bottom: TabBar(
          controller: traderTabController,
          indicatorColor: const Color(0xFFED222E),
          indicatorWeight: 4,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFED222E)),
          unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF606060)),
          tabs: const [
            Tab(text: "For You",),
            Tab(text: "Traders",),
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(
        controller: traderTabController,
        children: [
          buildNewsList(),
          const TradersListPage(),
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
            name: "Kevin Jones",
            desc: "The Chill Guy meme coin dropped over 45% in just 30 minutes after it came out that the project does not have any meme..",
          ),
        );
      },
    );
  }

}
