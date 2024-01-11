import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/page/about_us_page.dart';
import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page/home_page.dart';

//Ici on créé notre routeur
// La route "/" peut aller vers la route "/cart"
// et au retour, elle revient sur "/"
final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => HomePage(), routes: [
    GoRoute(
      path: 'cart',
      builder: (_, __) => CartPage(),
    ),
    GoRoute(
      path: 'about-us',
      builder: (_, __) => AboutUsPage(),
    ),
    GoRoute(
        path: 'detail',
        builder: (_, state) => DetailPage(article: state.extra as Article))
  ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
