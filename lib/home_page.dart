import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final listArticles = [
    Article(
        nom: "MBP",
        description: "Ordinateur très che",
        image: "https://store.storeimages.cdn-apple.com/4668/"
            "as-images.apple.com/is/mbp-14-spacegray-cto-hero-202310"
            "?wid=772&hei=466&fmt=jpeg&qlt=95&.v=1697913381764",
        prix: 9000,
        categorie: "Oridnateur low-cost"),
    Article(
        nom: "MBP 18",
        description: "Ordinateur très cher",
        image: "https://store.storeimages.cdn-apple.com/4668/"
            "as-images.apple.com/is/mbp-14-spacegray-cto-hero-202310"
            "?wid=772&hei=466&fmt=jpeg&qlt=95&.v=1697913381764",
        prix: 12000,
        categorie: "Oridnateur low-cost mais un peu plus grand"),
    Article(
        nom: "Dell XPS",
        description: "Ordinateur très cher",
        image:
            "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/xps-notebooks/xps-15-9530/media-gallery/touch-black/notebook-xps-15-9530-t-black-gallery-1.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=654&qlt=100,1&resMode=sharp2&size=654,402&chrss=full",
        prix: 2300,
        categorie: "Oridnateur ultra low-cost mais un peu plus grand"),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.go('/cart'),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.separated(
          itemCount: listArticles.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, int index) => ItemArticle(
                listArticles: listArticles,
                index: index,
              )));
}

class ItemArticle extends StatelessWidget {
  const ItemArticle({
    super.key,
    required this.listArticles,
    required this.index,
  });

  final List<Article> listArticles;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(listArticles[index].image),
      title: Text(listArticles[index].nom),
      subtitle: Text(
        listArticles[index].getPrixEuro(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: TextButton(
        child: const Text("AJOUTER"),
        onPressed: () {},
      ),
    );
  }
}
