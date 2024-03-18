import 'package:flutter/material.dart';
import 'package:odyssey_website/Landing/controller_animation.dart';
import 'package:odyssey_website/theme/my_colors.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                    //width: screenWidth / 4,
                    child: const SelectableText(
                  "Start today and embark on a journey where arcade games meet the future",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              MaterialButton(
                color: MyColors.action,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                onPressed: () {},
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    "Download",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //add other widget here to either be in horizontal or vertical
      Container(width: 500, child: const ControllerAnimation()),
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
