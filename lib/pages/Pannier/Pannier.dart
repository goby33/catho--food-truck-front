import 'package:catho_app_food_truck/client/entity/Pannier_object.dart';
import 'package:catho_app_food_truck/client/entity/cart_items_bloc.dart';
import 'package:flutter/material.dart';

class Pannier extends StatefulWidget {
  static const routeName = "/pannier";

  const Pannier({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Pannier'),
      ),
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
                          int nbreElement =
                              bloc.numberOfitemProduct(element.produit);
                          int prix = nbreElement * element.produit.prix;
                          return Container(
                            height: 100,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white24,
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: [
                                Image.network(element.produit.url_image),
                                const Spacer(),
                                Column(
                                  children: [
                                    const Spacer(),
                                    Center(
                                      child: Text(
                                        element.produit.nom,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              bloc.addToCart(
                                                  element.produit, -1);
                                            });
                                          },
                                          icon: const Icon(Icons.remove_circle),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        Text(nbreElement.toString()),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              bloc.addToCart(
                                                  element.produit, 1);
                                            });
                                          },
                                          icon: const Icon(Icons.add_circle),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  prix.toString() + " €",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: Icon(
                        Icons.remove_shopping_cart,
                        size: 100,
                        color: Colors.blueGrey,
                      ),
                    );
                  }
                } else {
                  return const Text("error");
                }
              }
            } else {
              return const Text("error");
            }
            return const CircularProgressIndicator();
          }),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
          height: 100,
          color: Colors.blueGrey,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "Total: " + bloc.getPrix().toString() + " €",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 45,
                  width: 200,
                  margin: const EdgeInsets.only(top: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    color: (bloc.getPrix() > 0) ? Colors.orange : Colors.grey,
                    onPressed: () {
                      if (bloc.getPrix() > 0) {
                        Navigator.pushNamed(
                          context,
                          '/',
                        );
                      }
                    },
                    child: const Text(
                      "Buy now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
