import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/chat/your_feed_page.dart';
import 'package:zacro_tribe/screens/crypto/crypto_tab_bar.dart';
import 'package:zacro_tribe/screens/demo/test_page.dart';
import 'package:zacro_tribe/screens/home/blank_page.dart';
import 'package:zacro_tribe/screens/home/explore_page.dart';
import 'package:zacro_tribe/screens/profile/profile_page.dart';
import 'package:zacro_tribe/screens/traders/traders_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedTabIndex = 0;
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_selectedTabIndex),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF2E2D2C),
        style: TabStyle.flip,
        color: Colors.white,
        activeColor: Colors.white,
        initialActiveIndex: _selectedTabIndex,
        onTap: _onItemTapped,
        items: [
          TabItem(icon: Image.asset(_selectedTabIndex == 0 ? 'assets/icons/ic_home_at.png' : 'assets/icons/ic_home.png', height: 24, width: 24,), title: 'Home'),
          TabItem(icon: Image.asset(_selectedTabIndex == 1 ? 'assets/icons/ic_search_at.png' : 'assets/icons/ic_search.png', height: 24, width: 24,), title: 'Search'),
          TabItem(icon: Image.asset(_selectedTabIndex == 2 ? 'assets/icons/ic_msg_at.png' : 'assets/icons/ic_msg.png', height: 24, width: 24,), title: 'Chat'),
          TabItem(icon: Image.asset(_selectedTabIndex == 3 ? 'assets/icons/ic_wallet_at.png' : 'assets/icons/ic_wallet.png', height: 24, width: 24,), title: 'Wallet'),
          TabItem(icon: Image.asset(_selectedTabIndex == 4 ? 'assets/icons/ic_profile_at.png' : 'assets/icons/ic_profile.png', height: 24, width: 24,), title: 'Profile'),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _buildPage(int index) {
    Widget? child;
    switch (index) {
      case 0:
        child = const ExplorePage();
        break;
      case 1:
        child = const AirdropScreen();
        break;
      case 2:
        child = const TradersListPage();
        break;
      case 3:
        child = const BlankPage();
        break;
      case 4:
        child = const BlankPage();
        break;
    }
    return Center(child: child,);
  }

}
