import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:zacro_tribe/widgets/demo/single_airdrop_item_header_delegate.dart';

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

  String formatDate(String? date) {
    DateTime parsedDate = DateTime.parse(date!);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
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
            delegate: SingleAirdropItemHeaderDelegate(
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
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                  color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: const Color(0xFFED222E),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 56,
                        onPressed: () {},
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Claim Airdrop",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            Image.asset('assets/icons/ic_wifi.png', height: 24, width: 24,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Text("Air Drop", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFEE333E)),),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headlineMedium,),
                      const SizedBox(width: 10,),
                      const Icon(Icons.verified_rounded, color: Colors.blue,),
                    ],
                  ),
                  const SizedBox(height: 20,),
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
