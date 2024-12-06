import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NewsPage extends StatelessWidget {
  final String imgPath;
  final String title;
  final String content;

  const NewsPage({Key? key, required this.imgPath, required this.title, required this.content,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with fixed height
          Container(
            height: 415,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgPath), // Use the provided image URL
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Add a dark overlay
            ),
          ),

          // Top Bar (Back and More Buttons)
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset(
                    'assets/icons/ic_back_arrow.png',
                    height: 24,
                    width: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle more action
                  },
                  icon: Image.asset(
                    'assets/icons/ic_more.png',
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),

          // Title and Info Section (Overlayed on the image)
          Positioned(
            top: 300,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Published on Feb 27, 2024',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.timer, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '2 min',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Scrollable Content Below the Image
          Positioned(
            top: 415, // Start content below the image
            left: 0,
            right: 0,
            bottom: 0, // Allow content to take up the rest of the space
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    const Text(
                      'GameFI',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Author Info
                    const Row(
                      children: [
                        Text(
                          'Cryptonewsreporter',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.check_circle, color: Colors.blue, size: 18),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Content (HTML rendered using HtmlWidget)
                    HtmlWidget(
                      content,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Placeholder for additional content
                    const Text(
                      'More content can go here...',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
