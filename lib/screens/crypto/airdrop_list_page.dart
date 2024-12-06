import 'package:flutter/material.dart';
import 'package:zacro_tribe/widgets/airdrop_list_widget.dart';

class AirdropListPage extends StatefulWidget {
  const AirdropListPage({super.key});

  @override
  State<AirdropListPage> createState() => _AirdropListPageState();
}

class _AirdropListPageState extends State<AirdropListPage> {

  // Track the selected tab index
  int _selectedIndex = 0;

  // Tabs data
  final List<String> _tabs = ['All', 'Latest', 'Hottest', 'Potential'];
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _pages = [
    const AirdropListWidget(),
    const AirdropListWidget(),
    const AirdropListWidget(),
    const AirdropListWidget(),
    const AirdropListWidget(),
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
    );
  }
}
