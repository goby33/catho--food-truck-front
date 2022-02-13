import 'package:catho_app_food_truck/cart_items_bloc.dart';
import 'package:flutter/material.dart';
import 'header.dart';
import 'pages/burgerPage/burger_page.dart';
import 'pages/Pannier/Pannier.dart';
import 'menu_liste.dart';
import 'pages/Pannier/Pannier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: FoodTruck(),
      routes: {
        BurgerPage.routeName: (context) => BurgerPage(),
        Pannier.routeName: (context) => Pannier(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodTruck extends StatefulWidget {
  @override
  _FoodTruckState createState() {
    return _FoodTruckState();
  }
}

class _FoodTruckState extends State<FoodTruck> {
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Deviver mer"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0, top: 20.0),
                child: GestureDetector(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 26,
                      ),
                      //TODO
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Pannier.routeName);
                  },
                ),
              ),
            ],
          ),
          Header(),
          MenuList(),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_alert),
                  color: Colors.white,
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.turned_in),
                  color: Colors.white,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Reglages:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Approvisionner mon compte'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
