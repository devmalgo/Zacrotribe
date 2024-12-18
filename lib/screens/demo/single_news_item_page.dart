import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
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

  String formatDate(String? date) {
    DateTime parsedDate = DateTime.parse(date!);
    String formattedDate = DateFormat('MMM dd, yyyy').format(parsedDate);
    return formattedDate;
  }

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
              date: formatDate(date),
              topPadding: topPadding,
              maxExtent: maxScreenSizeHeight / 2,
              minExtent: topPadding + 56,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFEE333E),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.verified_rounded,
                                color: Colors.blue,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/ic_copy_link.png",
                          height: 34,
                          width: 34,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  HtmlWidget(content),
                  const Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
