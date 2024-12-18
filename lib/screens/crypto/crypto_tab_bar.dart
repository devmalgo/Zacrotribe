import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/crypto/airdrop_list_page.dart';
import 'package:zacro_tribe/screens/crypto/create_airdrop_page.dart';
import 'package:zacro_tribe/screens/crypto/presale_list_page.dart';

class AirdropScreen extends StatefulWidget {
  const AirdropScreen({super.key});

  @override
  _AirdropScreenState createState() => _AirdropScreenState();
}

class _AirdropScreenState extends State<AirdropScreen> {

  int selectedIndex = 0;
  String selectedPage = 'Crypto Airdrop';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Air Drops',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'News from all crypto platforms.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            Container(
              height: 130,
              width: double.infinity,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateAirdropPage()));
                    },
                    icon: Image.asset('assets/icons/ic_box_add.png', height: 30, width: 30,),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Create your own airdrop', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Claim the Future, One Drop at a Time.'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomSlidingSegmentedControl<String>(
                    initialValue: selectedPage,
                    children: {
                      'Crypto Airdrop': Text('Air drop', style: TextStyle(color: selectedPage == 'Crypto Air Drop' ? Colors.white : const Color(0xFFDDDDDD), fontSize: 14, fontWeight: FontWeight.bold),),
                      'Presale': Text('Pre sale', style: TextStyle(color: selectedPage == 'Pre sale' ? Colors.white : const Color(0xFFDDDDDD), fontSize: 14, fontWeight: FontWeight.bold),),
                    },
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black, width: 0.25),
                    ),
                    thumbDecoration: BoxDecoration(
                      color: const Color(0xFFED222E),
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4.0,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    onValueChanged: (value) {
                      setState(() {
                        selectedPage = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: selectedPage == 'Crypto Airdrop'
                  ? const AirdropListPage()
                  : const PresaleListPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSegment(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
        ],
      ),
    );
  }

}


