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
      appBar: AppBar(title: Text('Pannier')),
      body: StreamBuilder(
          stream: bloc.getStream,
          initialData: bloc.allItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                List<PannierObject>? listPannier =
                    snapshot.data as List<PannierObject>?;
                if (listPannier != null) {
                  if (listPannier.isNotEmpty) {
                    return ListView(
                      children: List<Widget>.generate(
                        listPannier.length,
                        (index) {
                          PannierObject element = listPannier[index];
                          return Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Image.network(element.produit.url_image),
                                Spacer(),
                                Column(
                                  children: [
                                    Spacer(),
                                    Center(
                                      child: Text(element.produit.nom, style:
                                        TextStyle(
                                          fontSize: 18
                                        ),),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              bloc.addToCart(element.produit, -1);
                                            });
                                          },
                                          icon: Icon(Icons.remove_circle),
                                          color: Theme.of(context).accentColor,
                                        ),
                                        Text(bloc.numberOfitemProduct(element.produit).toString()),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              bloc.addToCart(element.produit, 1);
                                            });
                                          },
                                          icon: Icon(Icons.add_circle),
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text(
                                    (bloc.numberOfitemProduct(element.produit) * element.produit.prix).toString() + " €",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Text('pannier vide');
                  }
                } else {
                  return Text("error");
                }
              }
            } else {
              return Text("error");
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
