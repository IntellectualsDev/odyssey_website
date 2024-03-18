import 'package:flutter/material.dart';
import 'package:odyssey_website/theme/my_colors.dart';
import 'package:odyssey_website/globals.dart' as globals;

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _MobileAppBarState extends State<MobileAppBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double titleFontSize = width / 14;

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: MyColors.background,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                MyColors.backgroundGradient1,
                MyColors.backgroundGradient2
              ]),
        ),
      ),
      title: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SelectableText(
                  'The Odyssey',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: titleFontSize,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: MyColors.fontColor),
    );
  }
}

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => MobileDrawerState();
}

class MobileDrawerState extends State<MobileDrawer> {
  Widget _mobileDrawerTile(String text, String path, int index) => ListTile(
        title: Text(text),
        onTap: () {
          String currentPath = ModalRoute.of(context)?.settings.name ?? '';

          if (currentPath != path) {
            //no navegar si ya esta en esa pagina
            Navigator.pop(context);
            Navigator.pushNamed(context, path);
          } else {
            Navigator.pop(context);
          }

          globals.tab = index;
        },
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _mobileDrawerTile('Download', "/", 0),
          _mobileDrawerTile('About', "/about", 1),
        ],
      ),
    );
  }
}
