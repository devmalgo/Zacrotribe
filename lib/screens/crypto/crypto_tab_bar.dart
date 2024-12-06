import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/crypto/airdrop_list_page.dart';
import 'package:toggle_list/toggle_list.dart';

class AirdropScreen extends StatefulWidget {
  const AirdropScreen({super.key});

  @override
  _AirdropScreenState createState() => _AirdropScreenState();
}

class _AirdropScreenState extends State<AirdropScreen> {
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
                  Image.asset('assets/icons/ic_box_add.png', height: 30, width: 30,),
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
                      'Crypto Airdrop': Text('Crypto Air Drop', style: TextStyle(color: selectedPage == 'Crypto Air Drop' ? Colors.white : const Color(0xFFDDDDDD), fontSize: 14, fontWeight: FontWeight.bold),),
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
                  : CustomToggleListTile(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomToggleListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ToggleList(
          divider: const SizedBox(height: 25,),
          toggleAnimationDuration: const Duration(milliseconds: 300),
          scrollPosition: AutoScrollPosition.begin,
          trailing: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.expand_more, color: Color(0xFFEE333E), ),
          ),
          children: List.generate(
            5,
                (index) => ToggleListItem(
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
                            child: Image.asset('assets/images/binance_logo.png'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Title and subtitle
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meme",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Memereum",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  content: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Launch, Price, Type, Boost Row
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "In 27 Days",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Launch",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "1.2M USDT",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Price",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "ETH",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Type",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "x32",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Boost",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Take Part Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text("Take part"),
                        ),
                        SizedBox(height: 16),
                        // Social Media Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.cancel),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.telegram),
                              color: Colors.grey,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.discord),
                              color: Colors.grey,
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
                ),
          ),
        ),
      ),
    );
  }
}


