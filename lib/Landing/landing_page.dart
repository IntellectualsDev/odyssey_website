import 'package:flutter/material.dart';
import 'package:odyssey_website/NavBar/mobileNavBar.dart';
import 'package:odyssey_website/NavBar/navBar.dart';
import 'package:odyssey_website/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:odyssey_website/globals.dart' as globals;
import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: width <= 600 ? const MobileAppBar() : null,
      endDrawer: const MobileDrawer(),
      body: SingleChildScrollView(
          child: StickyHeader(
        header: (width > 600)
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
                colors: <Color>[MyColors.backgroundGradient1, MyColors.backgroundGradient2]),
          ),
          child:  Column(
            children: [
              Text('$isMobile', style: TextStyle(color: Colors.white),),
              isMobile ? Text("Use desktop to download platform",style: TextStyle(color: Colors.white)) : DownloadButton(fileUrl: "gs://the-odyssey-project.appspot.com/Odyssey.dmg"),
              
              
              const SizedBox(
                height: 1000,
              )
            ],
          ),
        ),
      )),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final String fileUrl;

  DownloadButton({required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getDownloadUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); 
        } else if (snapshot.hasError) {
          return SelectableText('Error: ${snapshot.error}', style: TextStyle(color: Colors.white),); // Display an error message if fetching the download URL fails
        } else {
          return ElevatedButton(
            onPressed: () => downloadFile(snapshot.data!),
            child: Text('Download Platform'),
          );
        }
      },
    );
  }

  Future<String> getDownloadUrl() async {
    final gsReference = FirebaseStorage.instance.refFromURL(fileUrl);
    return await gsReference.getDownloadURL();
  }

  Future<void> downloadFile(String downloadUrl) async {
    // Use url_launcher or any other method to download the file
    // For example:
    // await launch(downloadUrl);
    if (await canLaunch(downloadUrl)) {
    await launch(downloadUrl);
  } else {
    throw 'Could not launch $fileUrl';
  }
  }


}
