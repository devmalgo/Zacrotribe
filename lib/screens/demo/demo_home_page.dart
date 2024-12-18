import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:zacro_tribe/screens/crypto/crypto_tab_bar.dart';
import 'package:zacro_tribe/screens/home/blank_page.dart';
import 'package:zacro_tribe/screens/home/explore_page.dart';
import 'package:zacro_tribe/screens/profile/profile_page.dart';
import 'package:zacro_tribe/screens/profile/profile_settings/advertise_page.dart';
import 'package:zacro_tribe/screens/traders/trader_tab_page.dart';
import 'package:zacro_tribe/screens/traders/traders_list_page.dart';

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});



  @override
  _DemoHomePageState createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [Colors.white, Colors.white, Colors.white, Colors.white];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5 ? Colors.white : Colors.black;
    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: unselectedColor,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(500),
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor: Colors.black,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 24,
          iconWidth: 24,
          reverse: true,
          hideOnScroll: true,
          scrollOpposite: true,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: const [
              ExplorePage(),
              AirdropScreen(),
              TraderTabPage(),
              ProfilePage(),
            ],
          ),
          child: TabBar(
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            controller: tabController,
            indicatorColor: Colors.transparent,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: currentPage == 0
                        ? colors[0]
                        : currentPage == 1
                        ? colors[1]
                        : currentPage == 2
                        ? colors[2]
                        : currentPage == 3
                        ? colors[3]
                        : unselectedColor,
                    width: 4),
                insets: const EdgeInsets.fromLTRB(16, 8, 16, 8)),
            tabs: [
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Image.asset('assets/icons/ic_home_tab.png', height: 24, width: 24,)),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Image.asset('assets/icons/ic_crypto_tab.png', height: 24, width: 24,)),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Image.asset('assets/icons/ic_trader_tab.png', height: 24, width: 24,)),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Image.asset('assets/icons/ic_profile_tab.png', height: 24, width: 24,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}