import 'package:catho_app_food_truck/pages/Login.dart';
import 'package:catho_app_food_truck/pages/home/Home.dart';
import 'package:catho_app_food_truck/pages/Pannier/Pannier.dart';
import 'package:catho_app_food_truck/pages/burgerPage/burger_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

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
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.orange,
        primaryColor: Colors.teal,
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
        canvasColor: Colors.teal,
        bottomAppBarColor: Colors.teal,
        floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      ),
      home: Login(),
      routes: {
        BurgerPage.routeName: (context) => BurgerPage(),
        Pannier.routeName: (context) => Pannier(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
