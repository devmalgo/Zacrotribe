import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zacro_tribe/model/news_feed_list_model.dart';
import 'package:zacro_tribe/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/widgets/news_feed_widget.dart';

class ExploreMoreNewsPage extends StatefulWidget {
  const ExploreMoreNewsPage({super.key});

  @override
  State<ExploreMoreNewsPage> createState() => _ExploreMoreNewsPageState();
}

class _ExploreMoreNewsPageState extends State<ExploreMoreNewsPage> {

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
            return ListView.builder(
              itemCount: feeds.length,
              itemBuilder: (context, index) {
                final newsFeed = feeds[index];
                return NewsFeedWidget(id: newsFeed.sId!, title: newsFeed.title!, imgPath: newsFeed.image!, link: newsFeed.link!, category: newsFeed.category!, content: newsFeed.content!, creator: newsFeed.creator!, date: newsFeed.pubDate!);
              },
            );
          }
        },
      ),
    );
  }
}
