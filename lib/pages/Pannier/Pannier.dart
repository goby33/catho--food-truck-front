import 'package:catho_app_food_truck/client/entity/Produits.dart';
import 'package:catho_app_food_truck/pages/Pannier/Pannier_object.dart';
import 'package:flutter/material.dart';
import 'package:catho_app_food_truck/cart_items_bloc.dart';

class Pannier extends StatefulWidget {
  static const routeName = "/pannier";

  @override
  _PannierState createState() {
    return _PannierState();
  }
}

class _PannierState extends State<Pannier> {
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
      appBar: AppBar(title: Text('Checkout')),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {
          List<PannierObject>? posts = snapshot.data as List<PannierObject>?;
          return Text(posts!.length.toString());
        }

      ),
    );
  }
}
