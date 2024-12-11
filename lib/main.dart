import 'package:flutter/material.dart';
import 'package:router_innovation/functions.dart';
import 'package:router_innovation/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    customStatusBar(
        Color(0xffF4F6FF), Color(0xffF4F6FF), Brightness.dark, Brightness.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find Path',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff7E8EF1),
          secondary: Color(0xff7E8EF1),
          primary: Color(0xff615EFC),
          surface: Color(0xffF4F6FF),
          tertiary: Color(0xff4b4b4b),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
