import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/model/category_model.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  Future<CategoryModel> getCategory() async {
    final apiUrl = Uri.parse('${appConstants.baseUrl}/getCategory');
    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('GetCategorySuccess: ${response.statusCode}, MSg: ${bodyData['message']}');
        return CategoryModel.fromJson(jsonDecode(response.body));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception('GetCategoryFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}');
      }
    } catch (e) {
      throw Exception("GetCategoryError: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F5FF),
        body: FutureBuilder(
          future: getCategory(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFFED222E),),);
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"),);
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Text("Data Not Available");
            } else {
              final categories = snapshot.data!.data!;
              print('CategoryCount: ${categories.length}');
              return Column(
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
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return _buildNewsCategory(category.category!, category.image!);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildNewsCategory(String title, String imgUrl) {
    return Container(
      height: 50,
      width: 150,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
      ),
    );
  }

}
