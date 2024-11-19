import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/startup/decentralization_page.dart';

class SelectFlowPage extends StatelessWidget {
  const SelectFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          // Heading
          const Text('What Are You', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black,),),
          const Text('Looking For?', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFED222E),),),
          // Buttons for User, Trader, Guest
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DecentralizationPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFED222E),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('User', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
              ),
              const SizedBox(width: 10),
              // Trader Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DecentralizationPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFED222E),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Trader', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Guest Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DecentralizationPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Black background
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Guest', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
          ),
          const SizedBox(height: 100),
          Image.asset(
            'assets/images/welcome.png',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
