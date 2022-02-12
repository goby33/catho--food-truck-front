/// The [dart:async] is necessary for using streams
import 'dart:async';

import 'package:catho_app_food_truck/client/entity/Produits.dart';
class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();
  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;
  /// The [allItems] Map would hold all the data this bloc provides
  final List<Produit> allItems = [
  ];
  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
  void addToCart(Produit produit) {
    allItems.add(produit);
  }
  void deleteToCart(Produit produit) {
    if (allItems.contains(produit)) {
      allItems.remove(produit);
    }
  }
  int numberOfitemProduct(Produit produit) {
    return allItems.where((c) => c == produit).toList().length;
  }
}
final bloc = CartItemsBloc();  // add to the end of the file
