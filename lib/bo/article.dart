class Article {
  String nom;
  String description;
  String image;
  num prix;
  String categorie;

  Article({
    required this.nom,
    required this.description,
    required this.image,
    required this.prix,
    required this.categorie,
  });
  String getPrixEuro() => "${prix}€";

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'description': this.description,
      'image': this.image,
      'prix': this.prix,
      'categorie': this.categorie,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      nom: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      prix: map['price'] as num,
      categorie: map['category'] as String,
    );
  }
}

void main() {
  final listArticles = [
    Article(
        nom: "MBP",
        description: "Ordinateur très che",
        image: "https://store.storeimages.cdn-apple.com/4668/"
            "as-images.apple.com/is/mbp-14-spacegray-cto-hero-202310"
            "?wid=772&hei=466&fmt=jpeg&qlt=95&.v=1697913381764",
        prix: 9000,
        categorie: "Oridnateur low-cost")
  ];
  print("Le produit ${listArticles[0].nom} est vendu a un tarif de "
      "${listArticles[0].getPrixEuro()} ");
}
