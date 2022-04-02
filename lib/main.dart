import 'package:flutter/material.dart';

import 'GirisEkrani.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GirisEkrani()); //direkt return ettiğim için olmamış ama sebebini anlamadım
  }
}