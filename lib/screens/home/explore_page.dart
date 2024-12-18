import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/home/discover_page.dart';
import 'package:zacro_tribe/screens/home/explore_more_news_page.dart';
import 'package:zacro_tribe/screens/home/explore_news_page.dart';

import 'blank_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  // Track the selected tab index
  int _selectedIndex = 0;
  // Tabs data
  final List<String> _tabs = ['All', 'DeFi', 'GameFi', 'Video', 'Ethereum'];
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _pages = [
    ExploreNewsPage(),
    ExploreMoreNewsPage(),
    ExploreMoreNewsPage(),
    ExploreMoreNewsPage(),
    BlankPage(),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    double offset = index * 90.0;
    _scrollController.animateTo(offset, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset('assets/images/profile.png', height: 34, width: 34,),
          ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DiscoverPage()));
                },
                child: Image.asset('assets/icons/ic_discover.png', height: 34, width: 34,),
              ),
              const SizedBox(width: 15,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BlankPage()));
                },
                child: Image.asset('assets/icons/ic_reward.png', height: 34, width: 34,),
              ),
              const SizedBox(width: 25,),
            ],
          ),
        ],
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.white, // Match the background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom:  25.0),
              child: Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: Colors.black),),
            ),
            // Custom Tab Bar
            Container(
              height: 26, // Height of the custom tab bar
              margin: const EdgeInsets.only(right: 6, bottom: 6), // Vertical spacing
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: _tabs.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index; // Update selected index
                      });
                      _scrollToIndex(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.transparent,
                        borderRadius: BorderRadius.circular(30), // Rounded edges
                        border: Border.all(
                          color: isSelected ? Colors.red : const Color(0xFFDDDDDD),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        _tabs[index],
                        style: TextStyle(
                          fontSize: 14, // Font size for text
                          color: isSelected ? Colors.white : const Color(0xFFDDDDDD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Tab Content
            Expanded(
              child: _pages[_selectedIndex],
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
              padding: const EdgeInsets.all(20.0),
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
