import 'dart:async';

import 'package:catho_app_food_truck/client/entity/session_Object.dart';
import 'package:catho_app_food_truck/pages/Login.dart';
import 'package:catho_app_food_truck/pages/burgerPage/ArgumentsBurgerPage.dart';
import 'package:catho_app_food_truck/pages/burgerPage/burger_page.dart';
import 'package:catho_app_food_truck/pages/home/Home.dart';
import 'package:flutter/material.dart';

import '../client/entity/Produits.dart';
import '../client/repository/produitRepository.dart';

// APPEL API

void direction(BuildContext context, Produit produit) {
  Navigator.pushNamed(
    context,
    BurgerPage.routeName,
    arguments: ArgumentsBurgerPage(produit),
  );
}
// CLASS

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() {
    return _MenuListState();
  }
}

bool afficher = true;

class _MenuListState extends State<MenuList> {
  int currentSelectedItem = 0;
  List<String> textsCategories = ['menu', 'plat', 'boisson', 'dessert'];
  List<IconData> iconsCategories = [
    Icons.fastfood,
    Icons.food_bank_rounded,
    Icons.hourglass_empty,
    Icons.pages
  ];
  late Future<List<Produit>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(textsCategories[currentSelectedItem]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: textsCategories.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 0, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentSelectedItem = index;
                            });
                            afficher = false;
                            futureAlbum = fetchAlbum(
                                textsCategories[currentSelectedItem]);
                            afficher = true;
                          },
                          child: Card(
                            color: index == currentSelectedItem
                                ? Colors.black.withOpacity(0.7)
                                : Colors.white,
                            child: Icon(
                              iconsCategories[index],
                              color: index == currentSelectedItem
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.7),
                            ),
                            elevation: 3,
                            margin: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 20 : 0,
                        right: 20,
                      ),
                      width: 90,
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(textsCategories[index][0].toUpperCase() +
                              textsCategories[index].substring(1) +
                              's'),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: FutureBuilder<List<Produit>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    List<Produit>? posts = snapshot.data;
                    if (posts != null) {
                      if (afficher) {
                        return GridView.count(
                          padding: const EdgeInsets.only(
                            bottom: 200,
                          ),
                          crossAxisCount: 2,
                          children: List<Widget>.generate(
                            posts.length,
                            (index) {
                              Produit element = posts[index];
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      //TODO
                                      direction(context, element);
                                    },
                                    child: Card(
                                      color: Theme.of(context).primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                element.nom,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                Text(
                                                  element.prix.toString() +
                                                      ' €',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                //BOUTON PLUS
                                                SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child:
                                                        const Icon(Icons.add),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      elevation: 3,
                                      margin: const EdgeInsets.all(5),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(45),
                                          bottomRight: Radius.circular(15),
                                          topLeft: Radius.circular(45),
                                          topRight: Radius.circular(45),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 35,
                                    right: 40,
                                    child: GestureDetector(
                                      onTap: () {
                                        direction(context, element);
                                      },
                                      child: SizedBox(
                                        height: 120,
                                        child: Image.network(element.url_image),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        print('pp');
                      }
                    }
                  }
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                  height: 100.0,
                  width: 100.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
