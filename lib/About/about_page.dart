import 'package:flutter/material.dart';
import 'package:odyssey_website/NavBar/mobileNavBar.dart';
import 'package:odyssey_website/NavBar/navBar.dart';
import 'package:odyssey_website/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  State <AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {



  @override
  Widget build(BuildContext context) {

double width = MediaQuery.of(context).size.width;
    double titleFontSize = width / 14;

    return Scaffold(
      appBar: width < 500
          ? const MobileAppBar()
          : null,
      endDrawer: const MobileDrawer(),
      body: Container(
        color: MyColors.darkBlue,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StickyHeader(
                header: (width >= 500)
                    ? NavBar(index: 1,)
                    : Container(), //only show the navigation bar if the app bar is not there so just when the display is big enough
                content: Container(
                  width: width,
                  child: const Column(
                    children: [
                      Text("Description of the members of the team"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}