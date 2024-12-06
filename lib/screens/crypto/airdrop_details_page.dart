import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:zacro_tribe/widgets/demo/single_news_item_header_delegate.dart';

class AirdropDetailsPage extends StatelessWidget {
  final String title;
  final String content;
  final String platform;
  final String category;
  final int totalValue;
  final String imgUrl;
  final String date;

  const AirdropDetailsPage({
    super.key,
    required this.title,
    required this.content,
    required this.platform,
    required this.category,
    required this.totalValue,
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
                  const Text("Air Drop", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFEE333E)),),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headlineMedium,),
                      const SizedBox(width: 10,),
                      const Icon(Icons.verified_rounded, color: Colors.blue,),
                    ],
                  ),
                  HtmlWidget(content),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
