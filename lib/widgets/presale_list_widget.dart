import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/model/presale_list_model.dart';
import 'package:zacro_tribe/screens/home/news_feed_web_page.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class PresaleListWidget extends StatefulWidget {

  final Color bgColor;
  final Color progressColor;

  const PresaleListWidget({super.key, required this.bgColor, required this.progressColor});

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
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: presales.length,
            itemBuilder: (context, index) {
              final presaleData = presales[index];
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: widget.bgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.network(presaleData.image!, height: 40, width: 40, fit: BoxFit.cover,),
                            ),
                            Column(
                              children: [
                                Text(presaleData.name!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                const Text('REGISTRATION IN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Image.asset('assets/images/binance.png', height: 30, width: 30, fit: BoxFit.contain,),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildInfoBadge("TOTAL RAISE 100K"),
                            buildInfoBadge("VALUE 2.8M"),
                            buildInfoBadge("MIN ALLOW \$10"),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        LinearProgressIndicator(
                          value: 0.3,
                          backgroundColor: Colors.grey.shade300,
                          color: widget.progressColor,
                          minHeight: 8,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '0/100,069 MECHA',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                if (presaleData.presaleLink != null || presaleData.presaleLink!.isEmpty) {
                                  print('PreSaleLink: ${presaleData.presaleLink}');
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsFeedWebPage(title: presaleData.name!, websiteLink: presaleData.presaleLink!)));
                                } else {
                                  print('Data Link is Empty');
                                }
                              },
                              child: const Text('PARTICIPATE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.clear_sharp, size: 20),
                                SizedBox(width: 8),
                                Icon(Icons.telegram, size: 20),
                                SizedBox(width: 8),
                                Icon(Icons.discord, size: 20),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              );
            },
          );
        }
      },
    );
  }

  Widget buildInfoBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

}
