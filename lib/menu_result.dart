import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
// APPEL API
Future<Album> fetchAlbum(String value) async {
  print('je charge');
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'+value));

  if (response.statusCode == 200) {
    print('tous vas bien');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
// CLASS
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class menuResult extends StatefulWidget {
  final String categorie;
  menuResult(this.categorie);


  @override
  _menuResultState createState() {
    return _menuResultState();
  }
}

class _menuResultState extends State<menuResult> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    print(widget.categorie);
    futureAlbum = fetchAlbum(widget.categorie);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 500,
      width: 100,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: /*new GridView.count(
        crossAxisCount: 2,
        children:  List<Widget>.generate(16, (index) {
          return  GridTile(
            child:  Card(
              color: Colors.white,
              child:  Center(
                child: Text(widget.categorie),
              ),
            ),
          );
        }),
      ),*/
      FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
