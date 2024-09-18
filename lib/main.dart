import 'package:flutter/material.dart';
import 'package:weather_app_bloc/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App by Sagnik',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
