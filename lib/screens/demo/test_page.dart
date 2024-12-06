import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  
  final String imgPath;

  const TestPage({super.key, required this.imgPath});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Sticky Header
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imgPath, // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5), // Gradient overlay
                  ),
                ],
              ),
              title: Text(
                'Game On: BNB Chain Dominates GameFi With Most Titles',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
                  Text(
                    'GameFI',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Subtitle
                  Row(
                    children: [
                      Text(
                        'Cryptonewsreporter',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Description
                  Text(
                    'Customize your news feed based on your interests. '
                        'Follow topics and sources that matter most to you for a tailored news experience. '
                        'As Bitcoin surges to unprecedented heights, casting a bullish shadow over the cryptocurrency market, '
                        'a significant yet often overlooked sector poised to reap the benefits of this resurgence is GameFi.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(height: 20),

                  // Comments Section
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Comment Input
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Post Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text('Post comments'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}