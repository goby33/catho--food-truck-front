/// The [dart:async] is necessary for using streams
import 'dart:async';

import 'package:catho_app_food_truck/client/entity/Produits.dart';
import 'package:catho_app_food_truck/pages/Pannier/Pannier_object.dart';
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
    Iterable<PannierObject> listPannierObject = allItems.where((c) => c.produit == produit);
    if (listPannierObject.isNotEmpty) {
      listPannierObject.first.quantity = quantity;
    } else {
      allItems.add(PannierObject(produit: produit, quantity: quantity));
    }
  }
  void deleteToCart(Produit produit) {
    /*if (allItems.contains(produit)) {
      allItems.remove(produit);
    }*/
    print('je supprime');
  }
  int numberOfitemProduct(Produit produit) {
    Iterable<PannierObject> listPannierObject = allItems.where((c) => c.produit == produit);
    if (listPannierObject.isNotEmpty) {
      return listPannierObject.first.quantity;
    }
    return 0;
  }
}
final bloc = CartItemsBloc();  // add to the end of the file
