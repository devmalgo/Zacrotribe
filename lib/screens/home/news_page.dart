import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, size: 20,)),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark, size: 19, color: Color(0xFFED222E),)),
              IconButton(onPressed: () {
                _showBottomSheet(context);
              }, icon: const Icon(Icons.more_vert_outlined, size: 16, color: Colors.black,)),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset('assets/images/news_img.png', height: 240, width: double.infinity, fit: BoxFit.contain,),
              ),
              const SizedBox(height: 20,),
              const Text("16 December    |    2 Min Read", style: TextStyle(fontSize: 14, color: Color(0xFFED222E)),),
              const SizedBox(height: 16,),
              const Text("Lorem Ipsum Is Simply Dummy Text", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),),
              const SizedBox(height: 16,),
              const Text("LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.\n", style: TextStyle(fontSize: 16),),
              const Text("Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.\n", style: TextStyle(fontSize: 16),),
              const Text("Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”\n", style: TextStyle(fontSize: 16),),
              const Text("“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”\n", style: TextStyle(fontSize: 16),),
              const Text("Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.", style: TextStyle(fontSize: 16),),
              const Text("“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.", style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share, size: 18,),
                title: const Text("Share", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_border, size: 18,),
                title: const Text("Save Story", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings_system_daydream, size: 18,),
                title: const Text("Browse Lorem Ipsum", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.block, size: 18,),
                title: const Text("Block Lorem Ipsum", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.flag_outlined, size: 18,),
                title: const Text("Report", style: TextStyle(fontSize: 12),),
                onTap: () {},
              ),
            ],
          ),
        );
      }
    );
  }

}
