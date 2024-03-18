import 'package:flutter/material.dart';
import 'package:odyssey_website/About/about_page.dart';
import 'package:odyssey_website/Landing/landing_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'globals.dart' as globals;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  setPathUrlStrategy();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     globals.isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'The Odyssey',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        String path = '/';

        if (settings.name != null) {
          final uri = Uri.parse(settings.name!);
          path = uri.path;
        }

        if (path == "/") {
          globals.tab = 0;

          return PageRouteBuilder( //uso esto para quitar la animacion
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const LandingPage(),
          );
        }
        if (path == "/about") {
          globals.tab = 1;

          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const AboutPage(),
          );
        }
      

       
      },
     
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: "Montserrat"),
      debugShowCheckedModeBanner: false,
    );
  }
}
