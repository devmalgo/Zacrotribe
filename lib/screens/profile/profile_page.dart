import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/profile/crypto_airdrop/crypto_airdrop_page.dart';
import 'package:zacro_tribe/screens/profile/pre_sale/pre_sale_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomSlidingSegmentedControl(
          initialValue: _currentIndex,
          children: {
            0: buildSegment("CRYPTO AIRDROP"),
            1: buildSegment("PRE SALE"),
          },
          decoration: BoxDecoration(
            color: const Color(0xFFA3A3A3),
            borderRadius: BorderRadius.circular(29.5),
          ),
          thumbDecoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00A3FF), Color(0xFF0065C2)],
            ),
            borderRadius: BorderRadius.circular(23.5),
          ),
          onValueChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _currentIndex == 0 ? const CryptoAirdropPage() : const PreSalePage(),
    );
  }

  Widget buildSegment(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
        ],
      ),
    );
  }
  
}
