import 'package:catho_app_food_truck/client/entity/User.dart';
import 'package:catho_app_food_truck/pages/Login.dart';
import 'package:catho_app_food_truck/pages/Pannier/Pannier.dart';
import 'package:catho_app_food_truck/pages/burgerPage/burger_page.dart';
import 'package:catho_app_food_truck/pages/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'client/entity/session_Object.dart';


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
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.org'),
  );
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
      home: createContent(),
      routes: {
        BurgerPage.routeName: (context) => const BurgerPage(),
        Pannier.routeName: (context) => const Pannier(),
        '/login': (context) => Login(),
        '/dashboard': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }

  createContent() {
    return StreamBuilder(
      stream: session.getStream,
      initialData: session.allItems,
      builder: (context, snapshot) {
        List<User>? user =
        snapshot.data as List<User>?;
        if (user!.length != 0) {
          return Home();
        } else {
          return Login();
        }
      },
    );
  }
}


