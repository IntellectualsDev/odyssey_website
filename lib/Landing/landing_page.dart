// import 'package:flutter/material.dart';
// import 'package:odyssey_website/Landing/download_button.dart';
// import 'package:odyssey_website/Landing/hero_section.dart';
// import 'package:odyssey_website/NavBar/mobileNavBar.dart';
// import 'package:odyssey_website/NavBar/navBar.dart';
// import 'package:odyssey_website/theme/my_colors.dart';
// import 'package:sticky_headers/sticky_headers/widget.dart';
// import 'package:odyssey_website/globals.dart' as globals;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});
//   @override
//   State<LandingPage> createState() => LandingPageState();
// }

// class LandingPageState extends State<LandingPage> {
//   bool isMobile = globals.isWebMobile;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double titleFontSize = width / 14;
//     debugPrint("$isMobile"); //check if platform is being run on mobile

//     return Scaffold(
//       extendBodyBehindAppBar:
//           true, // Extend gradient behind the app bar if present
//       appBar: width <= 600 ? const MobileAppBar() : null,
//       endDrawer: const MobileDrawer(),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: <Color>[
//               MyColors.backgroundGradient1,
//               MyColors.backgroundGradient2
//             ],
//           ),
//         ),
//         child: CustomScrollView(
//           slivers: <Widget>[
//             // SliverPersistentHeader to simulate sticky behavior
//             SliverPersistentHeader(
//               delegate: MySliverPersistentHeaderDelegate(
//                 minHeight: 60.0,
//                 maxHeight: 60.0,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: <Color>[
//                         MyColors.backgroundGradient1,
//                         MyColors.backgroundGradient2
//                       ],
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   child: (width >= 500)
//                       ? const NavBar(
//                           index: 0,
//                         )
//                       : Container(),
//                 ),
//               ),
//               pinned: true,
//             ),
//             // SliverList for the rest of the content
//             SliverToBoxAdapter(child:HeroSection()),
//             SliverPersistentHeader(
//               delegate: MySliverPersistentHeaderDelegate(
//                 minHeight: 60.0,
//                 maxHeight: 600,
//                 child: Container(
//                   color: Colors.blue,
//                   alignment: Alignment.center,
//                   child: Text('Sticky Header Simulation'),
//                 ),
//               ),
//               pinned: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   MySliverPersistentHeaderDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   double get minExtent => minHeight;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }



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
      appBar: width < 500 ? const MobileAppBar() : null,
      endDrawer: const MobileDrawer(),
      body: Container(
        decoration: const BoxDecoration(
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
              // width: width,
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
                  const HeroSection(),
                  SizedBox(height: 600,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 