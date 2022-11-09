import 'package:flutter/material.dart';
import 'package:jengjaew_shop/screens/add_product_screen.dart';
import 'package:jengjaew_shop/screens/home_screen.dart';
import 'package:jengjaew_shop/screens/login_screen.dart';
import 'package:jengjaew_shop/screens/product_info.dart';
import 'package:jengjaew_shop/screens/profile_screen.dart';
import 'package:jengjaew_shop/screens/register_screen.dart';
import 'package:jengjaew_shop/screens/top_up_screen.dart';
import 'package:jengjaew_shop/screens/transaction_screen.dart';
import 'package:jengjaew_shop/screens/withdraw_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomeScreen(),
  '/add_product': (BuildContext context) => AddProductScreen(),
  '/info_product': (BuildContext context) => ProductInfoScreen(),
  '/profile': (BuildContext context) => ProfileScreen(),
  '/top_up': (BuildContext context) => TopUpScreen(),
  '/withdraw': (BuildContext context) => WithdrawScreen(),
  '/transaction': (BuildContext context) => TransactionScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => RegisterScreen(),
};
