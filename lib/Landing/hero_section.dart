import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_website/Landing/controller_animation.dart';
import 'package:odyssey_website/Landing/download_button.dart';
import 'package:odyssey_website/theme/my_colors.dart';
import 'package:odyssey_website/globals.dart' as globals;

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool isMobile = globals.isWebMobile;
  late Future<String> _downloadUrlFuture;

  @override
  void initState() {
    super.initState();
    _downloadUrlFuture = getDownloadUrl();
  }

  Future<String> getDownloadUrl() async {
    final gsReference = FirebaseStorage.instance
        .refFromURL("gs://the-odyssey-project.appspot.com/Odyssey.dmg");
    return await gsReference.getDownloadURL();
  }

  List<Widget> pageChildren(double width) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 10;
    double spacing = screenWidth / 10;

    return <Widget>[
      SizedBox(
        width: screenWidth >= 1000 ? screenWidth * .5 : screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: screenWidth <= 1000
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: <Widget>[
              // TypewriterText(text: "Full stack \nDeveloper",fontSize: fontSize,isBold: true,),
              const SelectableText(
                "Embrace the journey",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 60,
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                    //width: screenWidth / 4,
                    child: SelectableText(
                  "Start today and embark on a journey where arcade games meet the future",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              isMobile
                  ? const Text(
                      "Use desktop to download platform",
                      style: TextStyle(color: Colors.white),
                    )
                  : FutureBuilder<String>(
                      future: _downloadUrlFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return SelectableText(
                            'Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.white),
                          );
                        } else {
                          return DownloadButton(
                            fileUrl: snapshot.data!,
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),

      //add other widget here to either be in horizontal or vertical
      !globals.isWebMobile
          ? Container(width: 500, child: const ControllerAnimation())
          : Container(), //TODO add container to explain for users to go on their desktop to download the game
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
