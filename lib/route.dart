import 'package:flutter/material.dart';
import 'package:jengjaew_shop/screens/add_product_screen.dart';
import 'package:jengjaew_shop/screens/home_screen.dart';
import 'package:jengjaew_shop/screens/product_info.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomeScreen(),
  '/add_product': (BuildContext context) => AddProductScreen(),
  '/info_product': (BuildContext context) => ProductInfoScreen(),
};
