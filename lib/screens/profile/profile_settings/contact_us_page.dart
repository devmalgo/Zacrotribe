import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/utils/app_constants.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController descProController = TextEditingController();
  String? country;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    descProController.dispose();
    super.dispose();
  }

  Future<void> submitForm() async {
    final apiUrl = Uri.parse("${appConstants.baseUrl}/contactUs");
    try {
      var data = {
        "name": nameController.text,
        "email": emailController.text,
        "mobileNumber": mobileController.text,
        "country": country,
        "details": descProController.text,
      };

      final response = await http.post(apiUrl, body: data);
      print('Url: $apiUrl, SendData: $data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        print("ContactUsSuccess: ${response.statusCode}, Msg: ${bodyData['message']}, Data: $bodyData");
        Navigator.of(context).pop();
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

    final topPadding = MediaQuery.of(context).padding.top;
    final maxScreenSizeHeight = MediaQuery.of(context).size.height;

    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: Color(0xFFDDDDDD),),
    );
    final focusBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: Colors.black),
    );
    final errorBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: const BorderSide(color: Color(0xFFED222E)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SingleContactUsPageHeaderDelegate(
              topPadding: topPadding,
              maxExtent: maxScreenSizeHeight / 3,
              minExtent: topPadding + 56,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contact Us", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                    const SizedBox(height: 25,),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
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
                    const SizedBox(height: 25,),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
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
                    const SizedBox(height: 25,),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25,),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Country',
                        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: focusBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                      items: ['India', 'USA', 'UK', 'Australia', 'Africa', 'China', 'Japan'].map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
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
                    const SizedBox(height: 25,),
                    TextFormField(
                      controller: descProController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Details About the Project',
                        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: focusBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your project details';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              submitForm();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 11.5, horizontal: 130),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Color(0xFFED222E),),
                            ),
                          ),
                          child: const Text("Submit", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFED222E)),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleContactUsPageHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double topPadding;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  const SingleContactUsPageHeaderDelegate({
    required this.topPadding,
    required this.maxExtent,
    required this.minExtent,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final screenWidth = MediaQuery.of(context).size.width;
    const animationDuration = Duration(milliseconds: 300);

    final showCategoryDate = shrinkOffset < 100;

    final calcForTileAnimation = (maxExtent - shrinkOffset - topPadding - 56 - 100) / 100;

    final titleAnimationValue = calcForTileAnimation > 1.0 ? 1.0 : calcForTileAnimation < 0.0 ? 0.0 : calcForTileAnimation;

    final calcForTopBarAnimation = (maxExtent - shrinkOffset - topPadding - 56) / 50;

    final topBarAnimationValue = calcForTopBarAnimation > 1.0 ? 1.0 : calcForTileAnimation < 0.0 ? 0.0 : calcForTileAnimation;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/cd_us_banner.png', fit: BoxFit.cover,),
        Positioned(
          bottom: 0,
          child: Container(
            height: maxExtent / 2,
            width: screenWidth,
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black45,
                  Colors.black12
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: AnimatedOpacity(
            opacity: titleAnimationValue,
            duration: animationDuration,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: animationDuration,
                    height: showCategoryDate ? 10 : 0,
                  ),
                  Text("Contact Us", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),),
                  AnimatedContainer(
                    duration: animationDuration,
                    height: showCategoryDate ? 15 : 0,
                  ),
                  Text("Get in touch to get help from our friendly support team", style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
                  AnimatedContainer(
                    duration: animationDuration,
                    height: showCategoryDate ? 15 : 0,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: AnimatedContainer(
            duration: animationDuration,
            height: 46 + topPadding,
            color: Colors.white.withOpacity(1 - topBarAnimationValue),
            width: screenWidth,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset('assets/icons/ic_back_arrow.png', height: 24, width: 24,),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();

}