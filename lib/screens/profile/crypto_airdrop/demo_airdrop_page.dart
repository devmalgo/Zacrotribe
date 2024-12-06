import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ContentPage extends StatelessWidget {

  final String title;
  final String content;

  const ContentPage({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: HtmlWidget(
          content,
          textStyle: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
