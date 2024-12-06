import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/model/airdrop_model.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class AirdropPage extends StatefulWidget {

  final String id;
  final String imgUrl;
  final String content;

  const AirdropPage({super.key, required this.id, required this.imgUrl, required this.content});

  @override
  State<AirdropPage> createState() => _AirdropPageState();
}

class _AirdropPageState extends State<AirdropPage> {

  @override
  void initState() {
    // getAirdrop(widget.id);
    super.initState();
  }
  
  Future<AirdropModel> getAirdrop(String id) async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/getSingleAirdrop?_id=$id');
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
        print('GetSingleAirdropSuccess: ${response.statusCode}, Data: $bodyData');
        return AirdropModel.fromJson(jsonDecode(response.body));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("GetSingleAirdropFailed: ${response.statusCode}, Msg:${errorBodyData['message']}");
      }
    } catch (e) {
      throw Exception("GetSingleAirdropError: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<AirdropModel>(
        future: getAirdrop(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFED222E),),);
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"),);
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Data Not Available"),);
          } else {
            final airdrop = snapshot.data!.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(airdrop.image!),
                        backgroundColor: Colors.grey[200],
                        radius: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildCounterBadge(airdrop.totalValue!),
                    const SizedBox(height: 20),
                    HtmlWidget(airdrop.content!, textStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                    const SizedBox(height: 20),
                    _buildClaimButton(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCounterBadge(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.remove_circle, color: Colors.red, size: 30),
        const SizedBox(width: 10),
        Text(
          '$count',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.add_circle, color: Colors.green, size: 30),
      ],
    );
  }

  Widget _buildAirdropInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Airdrop Link: GO TO AIRDROP",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Airdrop Confirmed",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text("Total Value: N/A", style: TextStyle(fontSize: 16)),
        Text("Platform: Own Chain", style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Text(
          "Blast is an L2 with native yield for ETH and stablecoins. Blast yield comes from ETH staking and RWA protocols. The yield from these decentralized protocols is passed back to Blast users automatically. The default interest rate on other L2s is 0%. On Blast, it's 4% for ETH and 5% for stablecoins.",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
        Text(
          "Blast has raised \$20 million from investors like Paradigm and Standard Crypto and has confirmed that it will do an airdrop for early users...",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildStepByStepGuide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "STEP-BY-STEP GUIDE:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildStepItem("Visit the Blast website."),
        _buildStepItem("You will need an invite code to access the platform."),
        _buildStepItem("Enter our exclusive unlimited invite code “WS7XR” and access the platform."),
        _buildStepItem("Follow them on Twitter and Discord and connect your wallet."),
        _buildStepItem("Bridge Ethereum or other tokens supported on Blast to the Ethereum Blast L2."),
        _buildStepItem("You will need some ETH or other tokens supported on Blast to be eligible to bridge."),
        _buildStepItem("You will now start earning Blast points based on your bridged amount."),
      ],
    );
  }

  Widget _buildStepItem(String stepText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        stepText,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildClaimButton() {
    return ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[50],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        "CLAIM AIRDROP",
        style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
