import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:odyssey_website/theme/my_colors.dart';


class DownloadButton extends StatelessWidget {
  final String fileUrl;

  DownloadButton({required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                color: MyColors.action,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                onPressed: () => downloadFile(context, fileUrl),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    "Download platform",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
  }

  Future<void> downloadFile(BuildContext context, String downloadUrl) async {
    if (await canLaunch(downloadUrl)) {
      await launch(downloadUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $fileUrl'),
        ),
      );
    }
  }
}