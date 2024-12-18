import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AdvertisePage extends StatefulWidget {
  const AdvertisePage({super.key});

  @override
  State<AdvertisePage> createState() => _AdvertisePageState();
}

class _AdvertisePageState extends State<AdvertisePage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  String? spots;

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
            delegate: SingleAdvertisePageHeaderDelegate(
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
                    const Text("Post your Advertise", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
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
                      controller: websiteController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Website',
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
                          return 'Please enter your website';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      controller: aboutController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        labelText: 'About Project',
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
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select Your Ads Spot',
                        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                        floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        border: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: focusBorderStyle,
                        errorBorder: errorBorderStyle,
                        focusedErrorBorder: errorBorderStyle,
                      ),
                      items: ['Top Header', 'Sidebar Ad-1', 'Sidebar Ad-2', 'Top Article Ad Spot', 'Bottom Article Ad Spot', 'Middle Article Ad Spot', 'Footer Ad'].map((String spots) {
                        return DropdownMenuItem<String>(
                          value: spots,
                          child: Text(spots),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          spots = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your Ad Spots';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 11.5, horizontal: 130),
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30),
                             side: BorderSide(
                               color: Color(0xFF)
                             ), 
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

class SingleAdvertisePageHeaderDelegate extends SliverPersistentHeaderDelegate {
  
  final double topPadding;
  
  @override
  final double maxExtent;
  
  @override
  final double minExtent;
  
  const SingleAdvertisePageHeaderDelegate({
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
        Image.asset('assets/images/ad_us_banner.png', fit: BoxFit.cover,),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: animationDuration,
                    height: showCategoryDate ? 10 : 0,
                  ),
                  Text("Advertise with Us", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),),
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