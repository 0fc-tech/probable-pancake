class Article{
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
  String getPrixEuro() => "$prix€";
}
void main(){
  final listArticles= [
    Article(nom: "MBP",
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