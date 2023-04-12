import 'package:flutter/material.dart';
import 'package:rent_car/pages/home_screen.dart';
import 'package:rent_car/pages/splash_screen.dart';
import 'constants/bottom_nav_bar.dart';
import 'pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent a Car',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SplashScreenWidget(),
    );
  }
}
