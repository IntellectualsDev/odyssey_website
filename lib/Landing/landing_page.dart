import 'package:flutter/material.dart';
import 'package:odyssey_website/Landing/download_button.dart';
import 'package:odyssey_website/Landing/hero_section.dart';
import 'package:odyssey_website/NavBar/mobileNavBar.dart';
import 'package:odyssey_website/NavBar/navBar.dart';
import 'package:odyssey_website/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:odyssey_website/globals.dart' as globals;
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  bool isMobile = globals.isWebMobile;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double titleFontSize = width / 14;
    debugPrint("$isMobile"); //check if platform is being run on mobile

    return Scaffold(
      extendBodyBehindAppBar: true, // Extend gradient behind the app bar if present
      appBar: width <= 600 ? const MobileAppBar() : null,
      endDrawer: const MobileDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              MyColors.backgroundGradient1,
              MyColors.backgroundGradient2
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: StickyHeader(
            header: (width >= 500)
                ? const NavBar(
                    index: 0,
                  )
                : Container(), //only show the navigation bar if the app bar is not there so just when the display is big enough
            content: Container(
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      MyColors.backgroundGradient1,
                      MyColors.backgroundGradient2
                    ]),
              ),
              child: Column(
                children: [
                  Text(
                    "Screen width $width",
                    style: TextStyle(color: Colors.white),
                  ),
                  HeroSection(),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


