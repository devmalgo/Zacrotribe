import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/traders/trader_profile_page.dart';

class TradersListPage extends StatefulWidget {
  const TradersListPage({super.key});

  @override
  State<TradersListPage> createState() => _TradersListPageState();
}

class _TradersListPageState extends State<TradersListPage> {

  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const TraderProfilePage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 180,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFFFF1F2), width: 1),
                      color: isClicked ? const Color(0xFFFFF1F2) : Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/profile.png'),
                          ),
                        ),
                        const Text("John marcell", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        const Text("14.3M Followers", style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Color(0xFFED222E), width: 1),
                              ),
                              backgroundColor: isClicked ? const Color(0xFFED222E) : Colors.white,
                          ),
                          child: Text(isClicked ? "Following" : "Follow", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isClicked ? Colors.white : const Color(0xFFED222E)),),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFFFFF1F2), width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/pf_img3.png'),
                        ),
                      ),
                      const Text("John marcell", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      const Text("14.3M Followers", style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Color(0xFFED222E), width: 1),
                            ),
                            backgroundColor: Colors.white
                        ),
                        child: const Text("Follow", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFED222E)),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFFFFF1F2), width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/pf_img1.png'),
                        ),
                      ),
                      const Text("John marcell", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      const Text("14.3M Followers", style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Color(0xFFED222E), width: 1),
                            ),
                            backgroundColor: Colors.white
                        ),
                        child: const Text("Follow", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFED222E)),),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFFFFF1F2), width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/pf_img.png'),
                        ),
                      ),
                      const Text("John marcell", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      const Text("14.3M Followers", style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Color(0xFFED222E), width: 1),
                            ),
                            backgroundColor: Colors.white
                        ),
                        child: const Text("Follow", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFED222E)),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
