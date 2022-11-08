import 'package:flutter/material.dart';
import 'package:jengjaew_shop/route.dart';
import 'package:jengjaew_shop/themes/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/home',
      routes: routes,
    );
  }
}
