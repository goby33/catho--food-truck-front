/// The [dart:async] is necessary for using streams
import 'dart:async';

import 'package:catho_app_food_truck/client/entity/Produits.dart';
import 'package:catho_app_food_truck/client/entity/Pannier_object.dart';
class CartItemsBloc {

  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final List<PannierObject> allItems = [
  ];

  void dispose() {
    cartStreamController.close(); // close our StreamController
  }

  // Methode
  void addToCart(Produit produit, int quantity) {
    Iterable<PannierObject> listPannierObject = allItems.where((c) => c.produit.nom == produit.nom);
    if (listPannierObject.isNotEmpty) {
      listPannierObject.first.quantity += quantity;
      if (listPannierObject.first.quantity == 0) {
        allItems.remove(listPannierObject.first);
      }
    } else {
      allItems.add(PannierObject(produit: produit, quantity: quantity));
    }
  }

  int numberOfitemProduct(Produit produit) {
    Iterable<PannierObject> listPannierObject = allItems.where((c) => c.produit == produit);
    if (listPannierObject.isNotEmpty) {
      return listPannierObject.first.quantity;
    }
    return 0;
  }

  int getAllQuantity() {
    int quantity = 0;
    for(PannierObject element in allItems ) {
      quantity += element.quantity;
    }
    return quantity;
  }
}
final bloc = CartItemsBloc();  // add to the end of the file
