import 'dart:convert';
import 'dart:io';
import 'package:catho_app_food_truck/client/entity/User.dart';
import 'package:catho_app_food_truck/client/entity/session_Object.dart';
import 'package:http/http.dart' as http;

Future<bool> fetchConnexion(String pseudo, String password) async {
  final response = await http.get(
    Uri.parse('https://morning-escarpment-57263.herokuapp.com/v1/user'),
    headers: <String, String>{
      'pseudo': pseudo,
      'mdt': password,
    },
  );
  if (response.statusCode == 202) {
    if (response.body != '') {
      var parsed = json.decode(response.body);
      session.setusers(User.fromJson(parsed));
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('Failed to load album');
  }
}
