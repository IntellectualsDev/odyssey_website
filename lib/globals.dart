library personal_portfolio.globals;
import 'package:flutter/foundation.dart';

//detectar si esta corriendo la app en celular o compu - > foundations.dart
bool isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
int tab = 0;