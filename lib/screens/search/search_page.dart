import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search News',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildNewsCategory('Financial News', Colors.blue),
                  _buildNewsCategory('Cryptocurrency News', Colors.orange),
                  _buildNewsCategory('Blockchain News', Colors.green),
                  _buildNewsCategory('Tech News', Colors.purple),
                  _buildNewsCategory('Business News', Colors.pink),
                  _buildNewsCategory('Market Analysis', Colors.yellow),
                  _buildNewsCategory('Regulation News', Colors.grey),
                  _buildNewsCategory('Investment Tips', Colors.amber),
                  _buildNewsCategory('Economic Trends', Colors.teal),
                  _buildNewsCategory('Startups And Innovation', Colors.brown),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCategory(String title, Color bgColor) {
    return Container(
      height: 50,
      width: 150,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
      ),
      child: Center(
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
      ),
    );
  }

}
