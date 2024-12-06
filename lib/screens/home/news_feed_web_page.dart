import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsFeedWebPage extends StatefulWidget {

  final String title;
  final String websiteLink;

  const NewsFeedWebPage({super.key, required this.title, required this.websiteLink});

  @override
  State<NewsFeedWebPage> createState() => _NewsFeedWebPageState();
}

class _NewsFeedWebPageState extends State<NewsFeedWebPage> {

  InAppWebViewController? webViewController;
  bool isBookMarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, size: 20,)),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isBookMarked = !isBookMarked;
                  });
                },
                icon: Icon(isBookMarked ? Icons.bookmark_outlined : Icons.bookmark_border_outlined, color: isBookMarked ? const Color(0xFFED222E) : Colors.grey, size: 19,),
              ),
              IconButton(onPressed: () {
                _showBottomSheet(context);
              }, icon: const Icon(Icons.more_vert_outlined, size: 16, color: Colors.black,)),
            ],
          ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(widget.websiteLink),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          print('Started loading: $url');
        },
        onLoadStop: (controller, url) async {
          print('Finished loading: $url');
        },
        onProgressChanged: (controller, progress) {
          const CircularProgressIndicator();
          print('Loading progress: $progress%');
        },
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
