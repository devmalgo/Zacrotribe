import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zacro_tribe/model/airdrop_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/utils/app_constants.dart';

class AirdropListWidget extends StatefulWidget {
  const AirdropListWidget({super.key});

  @override
  State<AirdropListWidget> createState() => _AirdropListWidgetState();
}

class _AirdropListWidgetState extends State<AirdropListWidget> {
  
  Future<AirdropListModel> getAirdrops() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/getAirdrop');
    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('GetAirdropsSuccess: ${response.statusCode}, Msg: ${bodyData['message']}');
        return AirdropListModel.fromJson(jsonDecode(response.body));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("GetAirdropsFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}");
      }
    } catch (e) {
      throw Exception("GetAirdropError: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAirdrops(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Color(0xFFED222E),),);
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"),);
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text("Data Not Available");
        } else {
          final airdrops = snapshot.data!.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            itemCount: airdrops.length,
            itemBuilder: (context, index) {
              final airdrop = airdrops[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                  margin: const EdgeInsets.only(top: 25.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(airdrop.image!),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(airdrop.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                            Text("Action: ${airdrop.platform}", style: const TextStyle(fontSize: 12),),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFEE333E),)),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
