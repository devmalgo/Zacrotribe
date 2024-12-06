import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/profile/contact_us_page.dart';
import 'package:zacro_tribe/screens/profile/crypto_airdrop/airdrop_page.dart';
import 'package:zacro_tribe/widgets/airdrop_list_widget.dart';

class CryptoAirdropPage extends StatefulWidget {
  const CryptoAirdropPage({super.key});

  @override
  State<CryptoAirdropPage> createState() => _CryptoAirdropPageState();
}

class _CryptoAirdropPageState extends State<CryptoAirdropPage> with SingleTickerProviderStateMixin {

  late TabController _cadTabController;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _cadTabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _cadTabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              controller: _cadTabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: const Color(0xFF00A3FF))
              ),
              indicatorColor: const Color(0xFFED222E),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
              tabs: const [
                Tab(text: " Latest Airdrops ",),
                Tab(text: " Hottest Airdrops ",),
                Tab(text: " Potential Airdrops ",),
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TabBarView(
                controller: _cadTabController,
                children: const [
                  AirdropListWidget(),
                  AirdropListWidget(),
                  AirdropListWidget(),
                ],
              ),
            ),
            Card.filled(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              color: const Color(0xFFB1D3FF),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 30),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.black),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 24,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactUsPage()));
                          },
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "CREATE YOUR OWN AIRDROP",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_outward, size: 12, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AirdropListView extends StatelessWidget {
  final List<Map<String, String>> airdrops = [
    {
      "name": "BLAST",
      "action": "Bridge ETH",
      "image": "assets/images/Blast_logo.png"
    },
    {
      "name": "F(X) PROTOCOL",
      "action": "Collect Point",
      "image": "assets/images/fx_logo.png"
    },
    {
      "name": "THE BACKWOODS",
      "action": "Collect Point",
      "image": "assets/images/backwoods_logo.png"
    },
    {
      "name": "KINETIX FINANCE",
      "action": "Make Trade",
      "image": "assets/images/kin_logo.png"
    },
    {
      "name": "ZETA",
      "action": "Trade and Earn Z-Score",
      "image": "assets/images/zeta_logo.png"
    },
    {
      "name": "HYBRID",
      "action": "Collect Point",
      "image": "assets/images/hybrid_logo.png"
    },
    {
      "name": "BINANCE",
      "action": "N/A",
      "image": "assets/images/binance_logo.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      itemCount: airdrops.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(airdrops[index]['image']!),
            backgroundColor: Colors.grey[200],
          ),
          title: Text(
            airdrops[index]['name']!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Action: ${airdrops[index]['action']}"),
          trailing: IconButton(onPressed: () {}, icon: Image.asset("assets/icons/ic_airdrop.png", height: 14, width: 14,)),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AirdropPage(imgUrl: airdrops[index]['image']!, id: '',)));
          },
        );
      },
    );
  }
}
