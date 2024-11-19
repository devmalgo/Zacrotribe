import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zacro_tribe/screens/home/news_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              // Open the Drawer
              Scaffold.of(context).openDrawer();
            },
            icon: Image.asset('assets/icons/ic_menu.png', height: 24, width: 24,),
          ),
        ),
        title: const Text("Daily News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset('assets/icons/ic_notification.png', height: 20, width: 20,)),
          IconButton(onPressed: () {}, icon: Image.asset('assets/icons/ic_gift.png', height: 20, width: 20,)),
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFFED222E),
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
              tabs: const [
                Tab(text: "My Feed",),
                Tab(text: "Latest News",),
                Tab(text: "Top News",),
                Tab(text: "Trader",),
              ],
            ),
            SizedBox(
              height: 210,
              child: PageView(
                controller: _pageController,
                children: [
                  _buildTopNewsBanner('assets/images/banner_img.png'),
                  _buildTopNewsBanner('assets/images/banner_img_2.png'),
                  _buildTopNewsBanner('assets/images/banner_img.png'),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotWidth: 8.0,
                dotHeight: 8.0,
                dotColor: Colors.grey,
                activeDotColor: Color(0xFFED222E),
              ),
            ),
            const SizedBox(height: 10,),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return newsItem("assets/images/ct_img_1.png");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNewsBanner(String imgPath) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }

  Widget newsItem(String imgPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsPage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cryptocurrency Values Surged \nAbove \$60,000, Reaching Its \nHighest Point Since 2021.", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("LoremIpsum.Net", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),),
                    SizedBox(width: 10,),
                    Text('27 Min', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),),
                    SizedBox(width: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.bookmark_border, size: 10,),
                        SizedBox(width: 5,),
                        Icon(Icons.mode_comment_outlined, size: 10,),
                        SizedBox(width: 5,),
                        Icon(Icons.share, size: 10,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 100,
              width: 120,
              margin: const EdgeInsets.only(left: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                DrawerItem(
                  icon: 'assets/icons/ic_settings.png',
                  title: 'Settings',
                ),
                DrawerItem(
                  icon: 'assets/icons/ic_notifications.png',
                  title: 'Notification',
                ),
                DrawerItem(
                  icon: 'assets/icons/ic_calendar_events.png',
                  title: 'IRL events',
                ),
                DrawerItem(
                  icon: 'assets/icons/ic_announcement.png',
                  title: 'Advertise with us',
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(icon: "assets/icons/ic_facebook.png"),
              SocialIcon(icon: "assets/icons/ic_instagram.png"),
              SocialIcon(icon: "assets/icons/ic_telegram.png"),
              SocialIcon(icon: "assets/icons/ic_twitter.png"),
            ],
          ),
          const Divider(),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.logout, size: 24, color: Color(0xFF130F26),),
                  SizedBox(width: 10,),
                  Text("Log out", style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String icon;
  final String title;

  DrawerItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(icon, height: 28, width: 28,),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18,),
      onTap: () {
        // Handle item tap
      },
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String icon;

  SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.asset(icon, height: 31, width: 31, fit: BoxFit.contain,),
    );
  }
}
