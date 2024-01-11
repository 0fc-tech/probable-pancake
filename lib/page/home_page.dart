import 'dart:convert';

import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
          ),
          IconButton(
              onPressed: () => context.go("/about-us"),
              icon: Icon(Icons.info_outline))
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
