import 'package:catho_app_food_truck/pages/Login.dart';
import 'package:catho_app_food_truck/pages/Pannier/Pannier.dart';
import 'package:catho_app_food_truck/pages/burgerPage/burger_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
        canvasColor: Colors.teal,
        bottomAppBarColor: Colors.teal,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.orange),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
      ),
      home: const Login(),
      routes: {
        BurgerPage.routeName: (context) => const BurgerPage(),
        Pannier.routeName: (context) => const Pannier(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
