import 'dart:async';

import 'package:catho_app_food_truck/client/entity/User.dart';

class SessionBloc {
  final SessionStreamController = StreamController.broadcast();

  Stream get getStream => SessionStreamController.stream;


  final List<User> allItems = [];


  void dispose() {
    SessionStreamController.close(); // close our StreamController
  }

  /*bool isConnected() {
    return !user;
  }*/
void setusers(User user) {
  this.allItems.add(user);
}
bool isConnected() {
  return this.allItems.length != 0;
}

// Methode
}

final session = SessionBloc(); // add to the end of the file
