import 'package:flutter/material.dart';

class ControllerAnimation extends StatelessWidget {
  const ControllerAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/Controller.png",
          fit: BoxFit.cover,
        ),
        Positioned(
          // Adjust the top, left, right, and bottom values to position the GIF as needed
          top: 40,
          left: 110,
          child: Image.asset(
            "assets/images/ControllerVideo.gif",
            width: 278,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
