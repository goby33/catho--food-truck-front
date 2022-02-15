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

  String getName() {
    if (allItems.length != 0) {
      return allItems.first.nom + " " + allItems.first.prenom;
    }
    return '';
  }

  String getFormation() {
    if (allItems.length != 0) {
      return allItems.first.formation;
    }
    return '';
  }

  double getSolde() {
    if (allItems.length != 0) {
      return allItems.first.solde;
    }
    return 0;
  }

  String getUrl() {
    if (allItems.length != 0) {
      return allItems.first.url_image;
    }
    return '';
  }

  void setNewSolde(double solde) {
    if (allItems.length != 0) {
       allItems.first.solde -= solde;
       if (allItems.first.solde < 0) {
         allItems.first.solde = 0;
       }
    }
  }

  void deconnexion() {
    allItems.clear();
  }



// Methode
}

final session = SessionBloc(); // add to the end of the file
