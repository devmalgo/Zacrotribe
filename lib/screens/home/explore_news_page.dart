import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zacro_tribe/model/news_feed_list_model.dart';
import 'package:zacro_tribe/utils/app_constants.dart';
import 'package:zacro_tribe/widgets/news_banner_widget.dart';
import 'package:zacro_tribe/widgets/news_feed_widget.dart';

class ExploreNewsPage extends StatefulWidget {
  const ExploreNewsPage({super.key});

  @override
  State<ExploreNewsPage> createState() => _ExploreNewsPageState();
}

class _ExploreNewsPageState extends State<ExploreNewsPage> {

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<NewsFeedListModel> getNewsFeed() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/feed');
    try {
      final response = await http.get(apiUrl);
      print('Token Here: x---> ${appConstants.accessToken}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('FetchNewsFeedSuccessfully: ${response.statusCode}, Msg: ${bodyData['message']}');
        return NewsFeedListModel.fromJson(jsonDecode(response.body));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("FetchNewsFeedFailed: ${response.statusCode}, Status: ${errorBodyData['status']}");
      }
    } catch (e) {
      throw Exception("GetNewsFeedError: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getNewsFeed(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFED222E),),);
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Data Not Available"));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"),);
          } else {
            final feeds = snapshot.data!.data!;
            print('feedsCount: ${feeds.length}');
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Breaking News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
                        GestureDetector(
                          onTap: () {},
                          child: const Text("View All", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFFEE333E)),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: PageView(
                      controller: _pageController,
                      children: const [
                        NewsBannerWidget(imgPath: 'assets/images/nf_banner_img.png'),
                        NewsBannerWidget(imgPath: 'assets/images/nf_banner_img.png'),
                        NewsBannerWidget(imgPath: 'assets/images/nf_banner_img.png'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 6.0,
                        dotWidth: 18.0,
                        dotColor: Color(0xFFDDDDDD),
                        activeDotColor: Color(0xFFED222E),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: feeds.length,
                      itemBuilder: (context, index) {
                        final newsFeed = feeds[index];
                        return NewsFeedWidget(id: newsFeed.sId!, title: newsFeed.title!, imgPath: newsFeed.image!, link: newsFeed.link!, category: newsFeed.category!, content: newsFeed.content!, creator: newsFeed.creator!, date: newsFeed.pubDate!);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
