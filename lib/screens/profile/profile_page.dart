import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/profile/profile_settings/advertise_page.dart';
import 'package:zacro_tribe/screens/profile/profile_settings/contact_us_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Banner with Stack
            Stack(
              children: [
                // Background Image with rounded bottom-left corner
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/images/profile_banner.png',
                    width: double.infinity,
                    height: 325,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  child: IconButton(
                    icon: Image.asset('assets/icons/ic_share_bg.png', height: 24, width: 24,),
                    onPressed: () {
                      // Share functionality
                    },
                  ),
                ),
                // Profile Details with Blur Effect
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0, // Optionally add padding for responsiveness
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // Blur intensity
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25), // Inner padding for content
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4), // Semi-transparent overlay
                          borderRadius: BorderRadius.circular(12), // Matches ClipRRect
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kunal Gowswami',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.0),
                              child: Text(
                                'Trader',
                                style: TextStyle(
                                  color: Color(0xFF606060),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2K',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    Text(
                                      'Following',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0), // Add spacing around the divider
                                  child: VerticalDivider(
                                    color: Colors.white, // Divider color
                                    thickness: 1, // Divider thickness
                                    width: 20, // Spacing between items
                                    indent: 4, // Top padding of the divider
                                    endIndent: 4, // Bottom padding of the divider
                                  ),
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '4K',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                const Spacer(), // Pushes social icons to the end
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/ic_telegram_bk.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Image.asset(
                                      'assets/icons/ic_twitter_bk.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Image.asset(
                                      'assets/icons/ic_discord.png',
                                      height: 24,
                                      width: 24,
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
                ),
              ],
            ),
            // Profile Settings List
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Profile Settings', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      height: 40,
                      child: ListTile(
                        leading: Image.asset('assets/icons/ic_edit_profile.png', height: 24, width: 24,),
                        title: const Text('Edit Profile', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                        subtitle: const Text('Username, Password, Bio, Email', style: TextStyle(fontSize: 12, color: Color(0xFF606060),),),
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFEE333E), size: 16,),
                        onTap: () {
                          // Navigate to Edit Profile
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      height: 40,
                      child: ListTile(
                        leading: Image.asset('assets/icons/ic_social_links.png', height: 24, width: 24,),
                        title: const Text('Social network links', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                        subtitle: const Text('Telegram, X, Discord etc.', style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFEE333E), size: 16,),
                        onTap: () {
                          // Navigate to Social Links
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      height: 40,
                      child: ListTile(
                        leading: Image.asset('assets/icons/ic_support.png', height: 24, width: 24,),
                        title: const Text('Advertisement', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                        subtitle: const Text('We offer associated with a service.', style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFEE333E), size: 16,),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdvertisePage()));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      height: 40,
                      child: ListTile(
                        leading: Image.asset('assets/icons/ic_support.png', height: 24, width: 24,),
                        title: const Text('Contact Us', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                        subtitle: const Text('We offer associated with a service.', style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFEE333E), size: 16,),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactUsPage()));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      height: 40,
                      child: ListTile(
                        leading: Image.asset('assets/icons/ic_policies.png', height: 24, width: 24,),
                        title: const Text('Privacy Policy', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                        subtitle: const Text('Explains how we safeguard your info.', style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFEE333E), size: 16,),
                        onTap: () {
                          // Navigate to Privacy Policy
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      height: 40,
                      child: ListTile(
                        leading: Image.asset('assets/icons/ic_about_us.png', height: 24, width: 24,),
                        title: const Text('About Us', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                        subtitle: const Text('Share who we are and why we exist.', style: TextStyle(fontSize: 12, color: Color(0xFF606060)),),
                        trailing: const Icon(Icons.chevron_right, color: Color(0xFFEE333E), size: 16,),
                        onTap: () {
                          // Navigate to About Us
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
