import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:zacro_tribe/model/news_feed_model.dart';
import 'package:zacro_tribe/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {

  final String id;

  const NewsPage({super.key, required this.id});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  bool _isBookMarked = false;

  Future<NewsFeedModel> getFullNews() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/getSingleFeed/?_id=${widget.id}');
    try {
      final response = await http.get(apiUrl);
      if(response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('GetSingleFeedSuccessful: ${response.statusCode}, Msg: ${bodyData['message']}');
        return NewsFeedModel.fromJson(jsonDecode(response.body));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception('GetSingleFeedFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}');
      }
    }
    catch (e) {
      throw Exception();
    }
  }

  Future<void> addFavourites() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/feedFavourite/?_id=${widget.id}&type=favourites');
    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${appConstants.accessToken}',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('AddFavouriteSuccess: ${response.statusCode}, Data: $bodyData');
        bool sts = bodyData['status'];
        if (sts) {
          setState(() {
            _isBookMarked = !_isBookMarked;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${bodyData['message']}")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${bodyData['message']}")));
        }
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("AddFavouriteFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}");
      }

    } catch (e) {
      throw Exception("AddFavouriteError: $e");
    }
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMMM').format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, size: 20,)),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  addFavourites();
                },
                icon: Icon(_isBookMarked ? Icons.bookmark_outlined : Icons.bookmark_border_outlined, size: 19, color: _isBookMarked ? const Color(0xFFED222E) : Colors.grey,),
              ),
              IconButton(onPressed: () {
                _showBottomSheet(context);
              }, icon: const Icon(Icons.more_vert_outlined, size: 16, color: Colors.black,)),
            ],
          ),
        ],
      ),
      body: FutureBuilder<NewsFeedModel>(
        future: getFullNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFED222E),),);
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Data Not Available"),);
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"),);
          } else {
            final newsFeed = snapshot.data!.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(newsFeed.image!, height: 240, width: double.infinity, fit: BoxFit.cover,),
                    ),
                    const SizedBox(height: 20,),
                    Text("${formatDate(newsFeed.pubDate!)}    |    2 Min Read", style: const TextStyle(fontSize: 14, color: Color(0xFFED222E)),),
                    const SizedBox(height: 16,),
                    Text(newsFeed.title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),),
                    const SizedBox(height: 16,),
                    HtmlWidget(newsFeed.content!, textStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share, size: 18,),
                title: const Text("Share", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_border, size: 18,),
                title: const Text("Save Story", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings_system_daydream, size: 18,),
                title: const Text("Browse Lorem Ipsum", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.block, size: 18,),
                title: const Text("Block Lorem Ipsum", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.flag_outlined, size: 18,),
                title: const Text("Report", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
            ],
          ),
        );
      }
    );
  }
}
