import 'package:catho_app_food_truck/client/entity/Produits.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Produit>> fetchAlbum(String value) async {
  final response = await http.get(Uri.parse(
      'https://morning-escarpment-57263.herokuapp.com/v1/' + value + '/all'));

  if (response.statusCode == 202) {
    var responseJson = json.decode(response.body);
    return (responseJson as List).map((p) => Produit.fromJson(p)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
