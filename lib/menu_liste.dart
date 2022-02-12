import 'package:catho_app_food_truck/menu_result.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

// APPEL API
Future<List<Album>> fetchAlbum(String value) async {
  print('je charge' + value);
  final response = await http.get(Uri.parse(
      'https://morning-escarpment-57263.herokuapp.com/v1/' + value + '/all'));

  if (response.statusCode == 202) {
    print('tous vas bien');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseJson = json.decode(response.body);
    return (responseJson as List).map((p) => Album.fromJson(p)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// CLASS
class Album {
  final int id;
  final String nom;
  final String description;
  final int prix;
  final int note;
  final String url_image;

  const Album({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.note,
    required this.url_image,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      prix: json['prix'],
      note: json['note'],
      url_image: json['url_image'],
    );
  }
}

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() {
    return _MenuListState();
  }
}

class _MenuListState extends State<MenuList> {
  int currentSelectedItem = 1;
  List<String> textsCategories = ['menu', 'plat', 'boisson', 'dessert'];
  List<IconData> iconsCategories = [
    Icons.fastfood,
    Icons.airplane_ticket,
    Icons.face_retouching_natural,
    Icons.pages
  ];
  late Future<List<Album>> futureAlbum;
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
            margin: EdgeInsets.only(top: 10),
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
                            futureAlbum = fetchAlbum(
                                textsCategories[currentSelectedItem]);
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
                            margin: EdgeInsets.all(10),
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
                          Spacer(),
                          Text(textsCategories[index][0].toUpperCase() +
                              textsCategories[index].substring(1) +
                              's'),
                          Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 500,
            child: FutureBuilder<List<Album>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    List<Album>? posts = snapshot.data;
                    if (posts != null) {
                      return GridView.count(
                        padding:EdgeInsets.only(
                          bottom: 200,
                        ),
                        crossAxisCount: 2,
                        children: List<Widget>.generate(
                          posts.length,
                          (index) {
                            Album element = posts[index];
                            return Stack(
                              children: [
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      //TODO
                                    },
                                    child: Card(
                                      color: Theme.of(context).primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Center(
                                              child:
                                              Text(
                                                element.nom,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),

                                            Spacer(),
                                            Row(
                                              children: [
                                                Spacer(),
                                                Text(
                                                  element.prix.toString() +
                                                      ' €',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                //BOUTON PLUS
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Icon(Icons.add),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      elevation: 3,
                                      margin: EdgeInsets.all(5),
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
                                ),
                                Positioned(
                                  top: 35,
                                  right:40,
                                  child: GestureDetector(
                                    onTap: () {
                                      //TODO
                                    },
                                    child: Container(
                                      height: 120,
                                      child: Image.network(
                                        element.url_image
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}