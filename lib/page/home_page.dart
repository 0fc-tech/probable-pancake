import 'dart:convert';

import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

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
          Badge(
            label: Text("${context.watch<Cart>().items.length}"),
            offset: const Offset(-6, 7),
            child: IconButton(
                onPressed: () => context.go('/cart'),
                icon: const Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: FutureBuilder<List<Article>>(
          future: fetchListArticles(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, int index) =>
                      ItemArticle(article: snapshot.data![index]))
              : const Icon(Icons.error)));

  Future<List<Article>> fetchListArticles() async {
    final response = await get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final listMapArticles = jsonDecode(response.body) as List<dynamic>;
      final listArticles = <Article>[];
      for (Map<String, dynamic> map in listMapArticles) {
        listArticles.add(Article.fromMap(map));
      }
      return listArticles;
    } else {
      throw Exception("Erreur lors de la réception des articles");
    }
  }
}

class ItemArticle extends StatelessWidget {
  const ItemArticle({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.go("/detail", extra: article),
      leading: Image.network(article.image),
      title: Text(article.nom),
      subtitle: Text(
        article.getPrixEuro(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: TextButton(
        child: const Text("AJOUTER"),
        onPressed: () => context.read<Cart>().addArticle(article),
      ),
    );
  }
}
