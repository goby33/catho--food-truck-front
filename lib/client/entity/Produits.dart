class Produit {
  final int id;
  final String nom;
  final String description;
  final int prix;
  final int note;
  final String url_image;

  const Produit({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.note,
    required this.url_image,
  });
  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      prix: json['prix'],
      note: json['note'],
      url_image: json['url_image'],
    );
  }
}
