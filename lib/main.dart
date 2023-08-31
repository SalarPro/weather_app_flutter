import 'package:flutter/material.dart';
import 'package:weather_app/wether_scree.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: WeatherScreen(),
  ));
}
