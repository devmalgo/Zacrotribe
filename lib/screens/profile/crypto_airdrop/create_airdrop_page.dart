import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class CreateAirdropPage extends StatefulWidget {
  const CreateAirdropPage({super.key});

  @override
  State<CreateAirdropPage> createState() => _CreateAirdropPageState();
}

class _CreateAirdropPageState extends State<CreateAirdropPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController imgFileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController platformController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController totalValController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        imgFileController.text = pickedFile.name;
      });
    }
  }

  Future<void> _showImageSourceDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Upload Image"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.photo_library),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  void dispose() {
    imgFileController.dispose();
    nameController.dispose();
    linkController.dispose();
    platformController.dispose();
    contentController.dispose();
    categoryController.dispose();
    totalValController.dispose();
    super.dispose();
  }
  
  Future<void> submitForm({
    required File imgFile,
    required String name,
    required String airdropLink,
    required String platform,
    required String content,
    required String category,
    required String totalValue}) async {
    final apiUrl = Uri.parse("${appConstants.baseUrlAdmin}/createAirdrop");
    try {
      var request = http.MultipartRequest('POST', apiUrl);

      request.files.add(
        http.MultipartFile(
          'image',
          imgFile.readAsBytes().asStream(),
          imgFile.lengthSync(),
          filename: imgFile.path.split('/').last,
        ),
      );

      request.fields['name'] = name;
      request.fields['airdropLink'] = airdropLink;
      request.fields['platform'] = platform;
      request.fields['content'] = content;
      request.fields['category'] = category;
      request.fields['totalValue'] = totalValue;

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = await response.stream.bytesToString();
        print('Success: $responseData');
      } else {
        print('Failed with status code: ${response.statusCode}');
      }

    } catch (e) {
      throw Exception("ContactUsError: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.grey[300]!),
    );
    final focusBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Color(0xFF1F3BAE)),
    );
    final errorBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.red),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F2FC),
      ),
      backgroundColor: const Color(0xFFF7F2FC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 33),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create Airdrop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Color(0xFF383C3E)),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Upload Image", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: imgFileController,
                        readOnly: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Upload Image File',
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                          suffixIcon: IconButton(onPressed: _showImageSourceDialog, icon: const Icon(Icons.file_upload_outlined, size: 14, color: Colors.black,)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please upload image here';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Name", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Airdrop Link", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: linkController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Airdrop Link',
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your airdrop link';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Platform", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: platformController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Platform',
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your platform';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Content", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: contentController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.newline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Category", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: categoryController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Category',
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your category';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Total Value", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: totalValController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Total Value',
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 1, left: 1, bottom: 1, right: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0xFFED222E),
                          const Color(0xFFFF2D00).withOpacity(0.72),
                        ],
                      ),
                  ),
                  child: MaterialButton(
                    minWidth: 140,
                    height: 40,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        submitForm(
                          imgFile: _selectedImage!,
                          name: nameController.text,
                          airdropLink: linkController.text,
                          platform: platformController.text,
                          content: contentController.text,
                          category: categoryController.text,
                          totalValue: totalValController.text
                        );
                      }
                    },
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
