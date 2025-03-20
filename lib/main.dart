import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wether_api/constants.dart';
import 'package:wether_api/home.dart';

void main() {
  runApp( MyApp());
}
Map weatherData = {};
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: mainColor,
      checkerboardOffscreenLayers: true,
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
      ),
      home: Home(city: "cairo",),
    );
  }
}