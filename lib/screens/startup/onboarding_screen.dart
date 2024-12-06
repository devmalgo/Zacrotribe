import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zacro_tribe/screens/auth/sign_in_page.dart';
import 'package:zacro_tribe/screens/startup/select_flow_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView for onboarding pages
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _isLastPage = (index == 2);
                });
              },
              children: [
                buildOnboardingPage(
                  image: 'assets/images/onboarding1.png', // Replace with your image path
                  title: 'Welcome to ',
                  subtitle: 'ZacroTribe',
                  description: 'Discover the latest financial, crypto, blockchain, and \nindustry news from the world\'s top sources. Stay informed \n and earn rewards effortlessly',
                ),
                buildOnboardingPage(
                  image: 'assets/images/onboarding2.png',
                  title: 'Welcome to ',
                  subtitle: 'ZacroTribe',
                  description: 'Discover the latest financial, crypto, blockchain, and \nindustry news from the world\'s top sources. Stay informed \n and earn rewards effortlessly',
                ),
                buildOnboardingPage(
                  image: 'assets/images/onboarding3.png',
                  title: 'Personalize Your ',
                  subtitle: 'Feed',
                  description: 'Customize your news feed based on your interests. Follow \n topics and sources that matter most to you for a tailored news experience',
                ),
              ],
            ),
            // Dot indicators
            Positioned(
              bottom: 350,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    spacing: 6,
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFFED222E),
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),
            // Buttons
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: _isLastPage
                  ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 56,
                            width: 190,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SelectFlowPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFED222E)
                              ),
                              child: const Text('Get Started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You have account?  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInPage()));
                            },
                            child: const Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFED222E)),),
                          ),
                        ],
                      ),
                    ],
                  )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 56,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFED222E)
                      ),
                      child: const Icon(Icons.arrow_outward, color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !_isLastPage,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.jumpToPage(3);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFED222E).withOpacity(0.2),
                    ),
                    child: const Text("Skip", style: TextStyle(color: Color(0xFFED222E), fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Onboarding page widget
  Widget buildOnboardingPage({required String image, required String title, required String subtitle, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Image.asset(image, height: 300),
          SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                title,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFED222E)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
