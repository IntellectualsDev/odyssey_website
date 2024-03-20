import 'package:flutter/material.dart';
import 'package:odyssey_website/theme/my_colors.dart';
import 'package:odyssey_website/globals.dart' as globals;

class NavBar extends StatefulWidget {
  final int index;

  const NavBar({super.key, required this.index});

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double sectionsFontSizeLarge = screenWidth / 80;
    double titleFontSizeLarge = screenWidth / 60;
    double sectionsFontSizeShort = screenWidth / 60;
    double titleFontSizeShort = screenWidth / 20;

    return NotificationListener<ScrollUpdateNotification>(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return _desktopNavBar(sectionsFontSizeLarge, titleFontSizeLarge);
          } else if (constraints.maxWidth > 800 &&
              constraints.maxWidth < 1200) {
            return _desktopNavBar(sectionsFontSizeLarge, titleFontSizeLarge);
          } else {
            return _shorterDisplayNavBar(
                sectionsFontSizeShort, titleFontSizeShort);
          }
        },
      ),
    );
  }

//navbar para displays mas cortos que una desktop pero mas grandes que un celular pequeno
  Widget _shorterDisplayNavBar(double sectionsFontSize, double titleFontSize) =>
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                MyColors.backgroundGradient1,
                MyColors.backgroundGradient2
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (globals.tab != 0) {
                      Navigator.pushNamed(context, "/");
                    }
                  },
                  child: Text(
                    "THE ODYSSEY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.fontColor,
                      fontSize: titleFontSize,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.index == 0)
                      _selectedNavBarButton("Download", sectionsFontSize)
                    else
                      _navBarButton("Download", "/", 0, sectionsFontSize),
                    const SizedBox(width: 30),
                    if (widget.index == 1)
                      _selectedNavBarButton("About", sectionsFontSize)
                    else
                      _navBarButton("About", "/about", 1, sectionsFontSize),
                    const SizedBox(width: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      );

//navbar para desktop grande
  Widget _desktopNavBar(double sectionsFontSize, double titleFontSize) =>
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                MyColors.backgroundGradient1,
                MyColors.backgroundGradient2
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.all(sectionsFontSize),
          //padding:  EdgeInsets.only(left: sectionsFontSize, right: sectionsFontSize,top: sectionsFontSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (globals.tab != 0) {
                      Navigator.pushNamed(context, "/");
                    }
                  },
                  child: Text(
                    "THE ODYSSEY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.fontColor,
                      fontSize: titleFontSize,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  if (widget.index == 0)
                    _selectedNavBarButton("Download", sectionsFontSize)
                  else
                    _navBarButton("Download", "/", 0, sectionsFontSize),
                  const SizedBox(width: 30),
                  if (widget.index == 1)
                    _selectedNavBarButton("About", sectionsFontSize)
                  else
                    _navBarButton("About", "/about", 1, sectionsFontSize),
                  const SizedBox(width: 30),
                ],
              )
            ],
          ),
        ),
      );

//botton que no tiene funcionalidad pero es para el diseno para mostrar la pagina en donde el usuario esta en la navbar
  Widget _selectedNavBarButton(String text, double fontSize) => MaterialButton(
        color: MyColors.myOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(fontSize)),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.only(
              left: fontSize,
              right: fontSize,
              top: fontSize / 4,
              bottom: fontSize / 4),
          child: Text(
            text,
            style: TextStyle(color: MyColors.fontColor, fontSize: fontSize),
          ),
        ),
      );

  //navBarbutton, en la navbar son los botones para navegar a las otras paginas
  Widget _navBarButton(String text, String path, int index, double fontSize) =>
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, path);
        },
        child: Text(
          text,
          style: TextStyle(color: MyColors.fontColor, fontSize: fontSize),
        ),
      );
}
