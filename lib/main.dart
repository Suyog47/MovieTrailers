import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_class/routers.dart';
import 'screens/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      onGenerateRoute: (settings) => Routers.generateRoutes(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}