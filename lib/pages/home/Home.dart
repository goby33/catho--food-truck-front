import 'package:catho_app_food_truck/client/entity/cart_items_bloc.dart';
import 'package:catho_app_food_truck/components/drawer.dart';
import 'package:catho_app_food_truck/components/footer.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';
import '../../components/menu_liste.dart';
import '../Pannier/Pannier.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
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
                        size: 40,
                      ),
                      if (bloc.getAllQuantity() > 0)
                        Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: CircleAvatar(
                            radius: 8.0,
                            backgroundColor: Colors.orangeAccent,
                            foregroundColor: Colors.white,
                            child: Text(
                              bloc.getAllQuantity().toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        )
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
      bottomNavigationBar: Footer(),
      drawer: MyDrawer()
    );
  }
}
