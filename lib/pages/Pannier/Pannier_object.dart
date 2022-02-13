import 'package:catho_app_food_truck/client/entity/Produits.dart';

class PannierObject {
  final Produit produit;
  late final int quantity;

   PannierObject({
    required this.produit,
    required this.quantity,
  });
}
