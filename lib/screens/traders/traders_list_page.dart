import 'package:flutter/material.dart';

class TradersListPage extends StatefulWidget {
  const TradersListPage({super.key});

  @override
  State<TradersListPage> createState() => _TradersListPageState();
}

class _TradersListPageState extends State<TradersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Follow Traders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
            SizedBox(height: 17,),
            Text("Get in touch to get help from our friendly support team", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
