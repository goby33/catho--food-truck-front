import 'package:flutter/material.dart';
import 'header.dart';
import 'categories.dart';
import 'Hambers_list.dart';
import 'burger_page.dart';
import 'burger_page_test.dart';

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
        BurgerPage.tag: (_)=> BurgerPage(),
        burger_page_test.tag: (_) => burger_page_test()
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
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: null
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.shopping_cart
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(burger_page_test.tag);
                  },
              ),
            ],
          ),
          Header(),
          Categories(),
          HambergersList(row: 1,),
          HambergersList(row: 2,),
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
    );
  }
}
