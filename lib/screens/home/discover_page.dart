import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/home/explore_more_news_page.dart';
import 'package:zacro_tribe/screens/home/explore_news_page.dart';

import 'blank_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  // Track the selected tab index
  int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();
  // Tabs data
  final List<String> _tabs = ['All', 'DeFi', 'GameFi', 'Video', 'Ethereum'];
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _pages = [
    const ExploreMoreNewsPage(),
    const ExploreMoreNewsPage(),
    const ExploreMoreNewsPage(),
    const ExploreMoreNewsPage(),
    const ExploreMoreNewsPage(),
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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset('assets/icons/ic_back_arrow.png', height: 24, width: 24,),
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.white, // Match the background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Discover", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
                  SizedBox(height: 17,),
                  Text("News from all crypto platforms", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),),
                ],
              ),
            ),
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF1F3BAE)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                prefixIcon: IconButton(onPressed: () {}, icon: Image.asset('assets/icons/ic_search_ns.png', height: 24, width: 24,)),
                suffixIcon: IconButton(onPressed: () {}, icon: Image.asset('assets/icons/ic_sort.png', height: 24, width: 24,)),
              ),
            ),
            SizedBox(height: 20,),
            // Custom Tab Bar
            Container(
              height: 26, // Height of the custom tab bar
              margin: const EdgeInsets.symmetric(vertical: 6), // Vertical spacing
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
