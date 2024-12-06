import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:zacro_tribe/widgets/demo/single_news_item_header_delegate.dart';

class SingleNewsItemPage extends StatelessWidget {
  final String title;
  final String content;
  final String author;
  final String category;
  final String authImgUrl;
  final String imgUrl;
  final String date;

  const SingleNewsItemPage({
    super.key,
    required this.title,
    required this.content,
    required this.author,
    required this.category,
    required this.authImgUrl,
    required this.imgUrl,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final maxScreenSizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SingleNewsItemHeaderDelegate(
              title: title,
              category: category,
              imgUrl: imgUrl,
              date: date,
              topPadding: topPadding,
              maxExtent: maxScreenSizeHeight / 2,
              minExtent: topPadding + 56,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFEE333E)),),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(author, style: Theme.of(context).textTheme.headlineMedium,),
                      const SizedBox(width: 10,),
                      const Icon(Icons.verified_rounded, color: Colors.blue,),
                    ],
                  ),
                  HtmlWidget(content),
                  const SizedBox(height: 16),
                  const Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Post comments", style: TextStyle(color: Colors.white),),
                      ),
                    ],
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
