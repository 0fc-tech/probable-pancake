import 'package:epsi_shop/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';

//Ici on créé notre routeur
// La route "/" peut aller vers la route "/cart"
// et au retour, elle revient sur "/"
final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => HomePage(), routes: [
    GoRoute(
      path: 'cart',
      builder: (_, __) => CartPage(),
    )
  ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
