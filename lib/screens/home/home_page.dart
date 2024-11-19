import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/chat/your_feed_page.dart';
import 'package:zacro_tribe/screens/home/explore_page.dart';
import 'package:zacro_tribe/screens/profile/profile_page.dart';
import 'package:zacro_tribe/screens/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  
  late TabController _tabController;
  final PageController _pageController = PageController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
      body: TabBarView(
        controller: _tabController,
        children: const [
          ExplorePage(),
          SearchPage(),
          YourFeedPage(),
          Center(child: Text("Wallet Page Content"),),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _tabController.index,
          backgroundColor: Colors.black.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int value) {
            setState(() {
              _tabController.index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _tabController.index == 0
                  ? Image.asset('assets/icons/ic_home_at.png', height: 24, width: 24,)
                  : Image.asset('assets/icons/ic_home.png', height: 24, width: 24,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _tabController.index == 1
                  ? Image.asset('assets/icons/ic_search_at.png', height: 24, width: 24,)
                  : Image.asset('assets/icons/ic_search.png', height: 24, width: 24,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: _tabController.index == 2
                  ? Image.asset('assets/icons/ic_msg_at.png', height: 24, width: 24,)
                  : Image.asset('assets/icons/ic_msg.png', height: 24, width: 24,),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: _tabController.index == 3
                  ? Image.asset('assets/icons/ic_wallet_at.png', height: 24, width: 24,)
                  : Image.asset('assets/icons/ic_wallet.png', height: 24, width: 24,),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: _tabController.index == 4
                  ? Image.asset('assets/icons/ic_profile_at.png', height: 24, width: 24,)
                  : Image.asset('assets/icons/ic_profile.png', height: 24, width: 24,),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
