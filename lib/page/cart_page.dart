import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EPSI Shop"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //Si j'ai plus de 0 éléments dans le panier j'affiche la liste
        //des éléments dans le panier
        //Sinon j'affiche le Widget EmptyCart qui affiche "Votre Panier est vide"
        child: context.watch<Cart>().items.isNotEmpty
            ? const ListCart()
            : const EmptyCart(),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Votre panier total est de"), Text("0.00€")],
        ),
        Spacer(),
        Text("Votre panier est actuellement vide"),
        Icon(Icons.image),
        Spacer()
      ],
    );
  }
}

class ListCart extends StatelessWidget {
  const ListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, cart, _) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Votre panier total est de"),
                    Text(cart.priceTotalInEuro())
                  ],
                ),
                //Ajouter la ligne de total (Row Votre panier total est de)
                //Avec le montant
                Flexible(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) => ListTile(
                            leading: Image.network(cart.items[index].image),
                            title: Text(cart.items[index].nom),
                            subtitle: Text(
                              cart.items[index].getPrixEuro(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            //Supprimer un élément du panier
                            trailing: TextButton(
                              child: const Text("SUPPRIMER"),
                              onPressed: () => context
                                  .read<Cart>()
                                  .removeArticle(cart.items[index]),
                            ),
                          )),
                ),
              ],
            ));
  }
}
