import 'package:advanced_bakery/model/bakery.dart';
import 'package:advanced_bakery/pages/cart_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -18, end: -7),
              badgeContent: Consumer<Bakery>(builder: (context, bakery, child) {
                final userCart = bakery.cart;
                int totalItems = 0;
                userCart.forEachIndexed(
                    (index, element) => totalItems += element.quantity);

                return (Text(totalItems.toString(),
                    style: const TextStyle(fontSize: 12)));
              }),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Theme.of(context).colorScheme.tertiary,
              ),
              child: const Icon(Icons.shopping_cart),
            )),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(
        "Baked With Love Bakery",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 0,
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
