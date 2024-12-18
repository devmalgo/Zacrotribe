import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_list/toggle_list.dart';
import 'package:zacro_tribe/model/presale_list_model.dart';
import 'package:zacro_tribe/screens/home/news_feed_web_page.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class PresaleListWidget extends StatefulWidget {

  const PresaleListWidget({super.key});

  @override
  State<PresaleListWidget> createState() => _PresaleListWidgetState();
}

class _PresaleListWidgetState extends State<PresaleListWidget> {
  
  Future<PresaleListModel> getPresaleList() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/getPresale');
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
        print('GetPresaleSuccess: ${response.statusCode}, Data: $bodyData');
        return PresaleListModel.fromJson(jsonDecode(response.body));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("GetPresaleFailed: ${response.statusCode}, Msg:${errorBodyData['message']}");
      }

    } catch (e) {
      throw Exception("GetPresaleError: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PresaleListModel>(
      future: getPresaleList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Color(0xFFED222E),),);
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text("Data Not Available"),);
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"),);
        } else {
          final presales = snapshot.data!.data!;
          return ToggleList(
            divider: const SizedBox(height: 10,),
            toggleAnimationDuration: const Duration(microseconds: 300),
            scrollPosition: AutoScrollPosition.begin,
            trailing: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Icon(Icons.expand_more, color: Color(0xFFEE333E),),
            ),
            children: List.generate(
              presales.length, (index) {
                final presale = presales[index];
                return ToggleListItem(
                  title: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Leading icon
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            child: Image.network(presale.image!),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Title and subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(presale.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                            Text("Category: ${presale.category!}", style: const TextStyle(color: Colors.grey, fontSize: 12,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  content: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Launch, Price, Type, Boost Row
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("In 27 Days", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                Text("Launch", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("1.2M USDT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                Text("Price", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("ETH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                Text("Type", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("x32", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                Text("Boost", style: TextStyle(color: Colors.grey, fontSize: 12),),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Take Part Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFED222E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text("Take part", style: TextStyle(color: Colors.white),),
                        ),
                        const SizedBox(height: 16),
                        // Social Media Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/ic_twitter.png', height: 24, width: 24,),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/ic_telegram.png', height: 24, width: 24,),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/ic_discord.png', height: 24, width: 24,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  headerDecoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  expandedHeaderDecoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

}
