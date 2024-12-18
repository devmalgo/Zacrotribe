import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/profile/pre_sale/pre_sale_details_page.dart';
import 'package:zacro_tribe/widgets/presale_list_widget.dart';

class PreSalePage extends StatefulWidget {
  const PreSalePage({super.key});

  @override
  State<PreSalePage> createState() => _PreSalePageState();
}

class _PreSalePageState extends State<PreSalePage> with SingleTickerProviderStateMixin {

  late TabController _saleTabController;

  @override
  void initState() {
    _saleTabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _saleTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: _saleTabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: const Color(0xFF00A3FF))
                ),
                indicatorColor: const Color(0xFFED222E),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                tabs: const [
                  Tab(text: " ALL ",),
                  Tab(text: " ENDED ",),
                  Tab(text: " ONGOING ",),
                  Tab(text: " UPCOMING ",),
                ],
              ),
              const SizedBox(height: 16),
              /*AirdropCard(
                projectName: 'METAVERSE',
                totalRaise: '100K',
                valuation: '2.8M',
                minAllocation: '0',
                progress: 0.3,
                symbolIcon: Icons.monetization_on, // Placeholder for Ethereum icon
                bgColor: Colors.blue.shade100,
                progressColor: Colors.blue,
              ),
              const SizedBox(height: 16),
              AirdropCard(
                projectName: 'PIXEL PIX',
                totalRaise: '85K',
                valuation: '1.5M',
                minAllocation: '0',
                progress: 0.6,
                symbolIcon: Icons.pie_chart, // Placeholder for Binance icon
                bgColor: Colors.purple.shade100,
                progressColor: Colors.purple,
              ),*/
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: TabBarView(
                  controller: _saleTabController,
                  children: [
                    CategoryTabs(bgColor: Colors.purple.shade100, progressColor: Colors.purple),
                    CategoryTabs(bgColor: Colors.blue.shade100, progressColor: Colors.blue),
                    CategoryTabs(bgColor: Colors.green.shade100, progressColor: Colors.green),
                    CategoryTabs(bgColor: Colors.red.shade100, progressColor: Colors.red),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTabs extends StatelessWidget {

  final Color bgColor;
  final Color progressColor;

  final List<Map<String, dynamic>> preSaleAirdrops = [
    {
      'projectName': 'META VERSE',
      'projectLogo': 'assets/images/thumb_1.png',
      'description': 'REGISTRATION IN:',
      'coinLogo': 'assets/images/ethereum.png',
      'totalRaise': '100K',
      'value': '2.8M',
      'allowance': '\$0',
      'progress': 0.3,
    },
    {
      'projectName': 'PIXEL PIX',
      'projectLogo': 'assets/images/thumb_2.png',
      'description': 'REGISTRATION IN:',
      'coinLogo': 'assets/images/binance.png',
      'totalRaise': '100K',
      'value': '1.5M',
      'allowance': '\$0',
      'progress': 0.6,
    },
  ];

  CategoryTabs({super.key, required this.bgColor, required this.progressColor});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: preSaleAirdrops.length,
      itemBuilder: (context, index) {
        final preSaleData = preSaleAirdrops[index];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: bgColor,
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
                        shape: const RoundedRectangleBorder(),
                        child: Image.asset(preSaleData['projectLogo'], height: 40, width: 40, fit: BoxFit.contain,),
                      ),
                      Column(
                        children: [
                          Text(preSaleData['projectName'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text(preSaleData['description'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Image.asset(preSaleData['coinLogo'], height: 30, width: 30, fit: BoxFit.contain,),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInfoBadge("TOTAL RAISE ${preSaleData['totalRaise']}"),
                      buildInfoBadge("VALUE ${preSaleData['value']}"),
                      buildInfoBadge("MIN ALLOW ${preSaleData['allowance']}"),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  LinearProgressIndicator(
                    value: preSaleData['progress'],
                    backgroundColor: Colors.grey.shade300,
                    color: progressColor,
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PreSaleDetailsPage()));
                        },
                        child: const Text('PARTICIPATE'),
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

class AirdropCard extends StatelessWidget {
  final String projectName;
  final String totalRaise;
  final String valuation;
  final String minAllocation;
  final double progress;
  final IconData symbolIcon;
  final Color bgColor;
  final Color progressColor;

  const AirdropCard({
    required this.projectName,
    required this.totalRaise,
    required this.valuation,
    required this.minAllocation,
    required this.progress,
    required this.symbolIcon,
    required this.bgColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  projectName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(symbolIcon, size: 32),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfoBadge('TOTAL RAISE $totalRaise'),
              buildInfoBadge('VALUE $valuation'),
              buildInfoBadge('MIN ALLO $minAllocation'),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade300,
            color: progressColor,
            minHeight: 8,
          ),
          SizedBox(height: 8),
          Text(
            '0/100,069 MECHA',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text('PARTICIPATE'),
              ),
              Row(
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
    );
  }

  Widget buildInfoBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
