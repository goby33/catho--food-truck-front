import 'dart:async';

import 'package:catho_app_food_truck/client/entity/User.dart';

class SessionBloc {
  final SessionStreamController = StreamController.broadcast();

  Stream get getStream => SessionStreamController.stream;


  late final User user;
  late final  bool connexion = false;


  void dispose() {
    SessionStreamController.close(); // close our StreamController
  }

  /*bool isConnected() {
    return !user;
  }*/
void setusers(User user) {
  this.user =  user;
}
bool isConnected() {
  return this.connexion;
}

// Methode
}

final session = SessionBloc(); // add to the end of the file
