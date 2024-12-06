import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/screens/auth/verify_otp_page.dart';
import 'package:zacro_tribe/utils/app_constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cfmPasswordController = TextEditingController();
  bool _isPwdVisible = false;
  bool _isCfmPwdVisible = false;
  bool _isButtonEnabled = false;

  void _validateInputs() {
    setState(() {
      _isButtonEnabled = nameController.text.isNotEmpty && emailController.text.isNotEmpty
          && passwordController.text.isNotEmpty && cfmPasswordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(_validateInputs);
    emailController.addListener(_validateInputs);
    passwordController.addListener(_validateInputs);
    cfmPasswordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cfmPasswordController.dispose();
  }
  
  Future<void> submitForm() async {
    final apiUrl = Uri.parse("${appConstants.baseUrl}/register");
    try {
      var data = {
        "userName": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "walletType": "trader"
      };

      final response = await http.post(apiUrl, body: data);
      print('URL: $apiUrl, Data: $data');

      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print('SignUpSuccess: ${response.statusCode}, Msg: ${bodyData['message']}, Data: $bodyData');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyOtpPage(email: emailController.text)));
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("SignUpFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}");
      }
    } catch (e) {
      throw Exception("SignUpPageError: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(color: Colors.grey[300]!,),
    );
    final focusBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: const BorderSide(color: Color(0xFF1F3BAE)),
    );
    final errorBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: const BorderSide(color: Colors.red),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFFED222E)),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Getting Started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "Seems you are new here!! ",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Color(0xFFED222E)),
                              children: [
                                TextSpan(
                                  text: "\nLet's set up your profile!!",
                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Color(0xFFED222E)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: focusBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obscureText: !_isPwdVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: focusBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPwdVisible = !_isPwdVisible;
                            });
                          },
                          icon: Icon(_isPwdVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey,),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (value.length > 64) {
                          return 'Password must be below 64 characters long';
                        }
                        // Password validation
                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$&*])').hasMatch(value)) {
                          return 'Password must contain at least \none uppercase letter, one number, \nand one special character';
                        }
                        // You can add more complex password validation here if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: cfmPasswordController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obscureText: !_isCfmPwdVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: focusBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isCfmPwdVisible = !_isCfmPwdVisible;
                            });
                          },
                          icon: Icon(_isCfmPwdVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey,),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value != passwordController.text) {
                          return 'Password do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _isButtonEnabled ? () {
                            if (formKey.currentState!.validate()) {
                              submitForm();
                            }
                          } : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 121),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                color: _isButtonEnabled ? const Color(0xFFED222E) : const Color(0xFF9493AC), // Border color based on button state
                                width: 2, // Border width
                              ),
                            ),
                            backgroundColor: _isButtonEnabled ? const Color(0xFFED222E) : const Color(0xFF9493AC),
                          ),
                          child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: _isButtonEnabled ? Colors.white : Colors.black),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Already have an account ?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF9493AC)),),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
                          },
                          child: const Text("Sign In", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFFED222E)),),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
