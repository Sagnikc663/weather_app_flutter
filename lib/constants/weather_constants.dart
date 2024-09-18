import 'package:flutter/material.dart';

class WeatherConstants {
  static const String apiKey = '3ac2b65852bea1e3b7441f23cc9281ef';
  static const String search = 'Search';
  static const String city = 'City';
  static const String todaysWeather = 'Todays weather in ';
  static const String weatherInYour = 'Weather in your city';
  static const String centiGrateCaps = '℃';
  static const String farenhiteCaps = '°F';
  static const String metric = 'metric';
  static const String imperial = 'imperial';

  static const textStyleUi = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const titleName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}

String centiOrFarenText(bool cenOrFar) {
  String a = cenOrFar ? '°F' : '℃';
  return a;
}
