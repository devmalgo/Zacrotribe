import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:zacro_tribe/screens/demo/single_news_item_page.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class NewsFeedWidget extends StatefulWidget {

  final String id;
  final String title;
  final String imgPath;
  final String link;
  final String category;
  final String content;
  final String creator;
  final String date;

  const NewsFeedWidget({super.key, required this.id, required this.title, required this.imgPath, required this.link, required this.category, required this.content, required this.creator, required this.date});

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {

  Future<void> getNewsPage() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/getSingleFeed/?_id=${widget.id}');
    try {
      final response = await http.get(apiUrl);

      if(response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('GetSingleFeedSuccessful: ${response.statusCode}, Msg: ${bodyData['message']}');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleNewsItemPage(title: widget.title, content: widget.content, author: widget.creator, category: widget.category, authImgUrl: 'assets/images/profile.png', imgUrl: widget.imgPath, date: widget.date)));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception('GetSingleFeedFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}');
      }
    }
    catch (e) {
      throw Exception();
    }
  }

  String formatDate(String? date) {
    DateTime parsedDate = DateTime.parse(date!);
    String formattedDate = DateFormat('MMM dd, yyyy').format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          getNewsPage();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 108,
              width: 138,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: NetworkImage(widget.imgPath), fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFFEE333E)),),
                    const SizedBox(width: 44,),
                    Text(formatDate(widget.date), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),),
                  ],
                ),
                SizedBox(
                  height: 58,
                  width: 167,
                  child: Text(widget.title, overflow: TextOverflow.ellipsis, maxLines: 3, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/ic_like_btn.png", height: 16, width: 16, fit: BoxFit.contain,),
                        const Text("245", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF7C7C7C)),),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Row(
                      children: [
                        Image.asset("assets/icons/ic_cmnt.png", height: 16, width: 16, fit: BoxFit.contain,),
                        const Text("27", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF7C7C7C)),),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Row(
                      children: [
                        Image.asset("assets/icons/ic_share_link.png", height: 16, width: 16, fit: BoxFit.contain,),
                        const Text("12", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF7C7C7C)),),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Image.asset("assets/icons/ic_save_disable.png", height: 16, width: 16, fit: BoxFit.contain,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
