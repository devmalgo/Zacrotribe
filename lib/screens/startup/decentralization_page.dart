import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/startup/sign_in_page.dart';

class DecentralizationPage extends StatelessWidget {
  const DecentralizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          // Heading
          const Text('Enter Into', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black,),),
          const Text('Decentralization', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFED222E),),),
          const SizedBox(height: 100,),
          // Central Image (replace 'assets/decentralization_image.png' with the path to your asset)
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(
              'assets/images/decentralization.png',
              height: 250,
            ),
          ),
          // Button
          const SizedBox(height: 120),
          ElevatedButton.icon(
            onPressed: () {showWalletDialog(context);},
            icon: const Icon(Icons.account_balance_wallet_outlined, size: 14, color: Colors.white,),
            label: const Text('Connect Wallet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              backgroundColor: const Color(0xFFED222E), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  void showWalletDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Center(child: Text("Connect a Wallet", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),)),
          actions: <Widget>[
            Column(
              children: [
                Container(
                  height: 38,
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFF5841F)
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 25,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                    },
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/icons/ic_metamask.png", height: 22, width: 22,),
                        ),
                        const Text(
                          "Metamask", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        ),
                        const SizedBox(height: 60,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 38,
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF3375BB)
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 25,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                    },
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/icons/ic_trust.png", height: 28, width: 28,),
                        ),
                        const Text(
                          "Trust", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        ),
                        const SizedBox(height: 60,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 38,
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF0052FF)
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 25,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                    },
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/icons/ic_exodus.png", height: 22, width: 22,),
                        ),
                        const Text(
                          "Exodus", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        ),
                        const SizedBox(height: 60,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ],
        );
      }
    );
  }

}
