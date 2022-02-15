
import 'dart:core';

import 'dart:ffi';

class User {

  final int id_user;
  final String prenom;
  final String url_image;
  late  double solde;
  final String formation;
  final String pseudo;
  final String nom;
  final String tocken;


  User({
    required this.id_user,
    required this.prenom,
    required this.url_image,
    required this.solde,
    required this.formation,
    required this.pseudo,
    required this.nom,
    required this.tocken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id_user: json['id_user'] as int,
      prenom: json['prenom'] as String,
      url_image: json['url_image'] as String,
      solde: json['solde'] as double,
      formation: json['formation'] as String,
      pseudo: json['pseudo'] as String,
      nom: json['nom'] as String,
      tocken: json['tocken'] as String,
    );
  }
}
