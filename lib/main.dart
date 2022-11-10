import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jengjaew_shop/route.dart';
import 'package:jengjaew_shop/services/auth_service.dart';
import 'package:jengjaew_shop/services/database_service.dart';
import 'package:jengjaew_shop/themes/style.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final messageKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(create: (_) => DatabaseService()),
        ProxyProvider<DatabaseService, AuthService>(
            update: (_, dbService, __) => AuthService(dbService: dbService))
      ],
      child: MaterialApp(
        scaffoldMessengerKey: messageKey,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        initialRoute: '/login',
        routes: routes,
      ),
    );
  }
}
