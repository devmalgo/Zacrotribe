import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zacro_tribe/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  String? country;

  bool isValidEmail(String email) {
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    descController.dispose();
    super.dispose();
  }

  Future<void> submitForm() async {
    final apiUrl = Uri.parse("${appConstants.baseUrl}/contactUs");
    try {
      var data = {
        "name": nameController.text,
        "email": emailController.text,
        "mobileNumber": phoneNoController.text,
        "country": country,
        "details": descController.text
      };

      final response = await http.post(apiUrl, body: data);
      print('URL: $apiUrl, Data: $data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print("ContactUsSuccess: ${response.statusCode}, Msg: ${bodyData['message']}, Data: $bodyData");
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("ContactUsFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}");
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
                const Text("Contact Us", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Color(0xFF383C3E)),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const Text("Email", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Email',
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
                            return 'Please enter your email address';
                          } else if (!isValidEmail(value)) {
                            return 'Please enter valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Phone Number", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: phoneNoController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
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
                      const SizedBox(height: 17,),
                      const Text("Country", style: TextStyle(fontSize: 12, color: Colors.black),),
                      DropdownButtonFormField(
                        hint: Text("Country", style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 10),),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: focusBorderStyle,
                          errorBorder: errorBorderStyle,
                          focusedErrorBorder: errorBorderStyle,
                        ),
                        items: ['India', 'USA', 'UK', 'Australia', 'Africa', 'China', 'Japan'].map((String role) {
                          return DropdownMenuItem<String>(
                            value: role,
                            child: Text(role),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            country = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your country';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 17,),
                      const Text("Details About The Project", style: TextStyle(fontSize: 12, color: Colors.black),),
                      TextFormField(
                        controller: descController,
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
                        submitForm();
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
