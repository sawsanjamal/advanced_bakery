import 'package:advanced_bakery/model/bakery.dart';
import 'package:advanced_bakery/model/cart_item.dart';
import 'package:advanced_bakery/components/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Bakery>(
      builder: (context, bakery, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 50,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name),
                      Text(
                        '\$' + cartItem.food.price.toString(),
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                  const Spacer(),
                  QuantitySelector(
                      food: cartItem.food,
                      onDecrement: () {
                        bakery.removeFromCart(cartItem);
                      },
                      onIncrement: () {
                        bakery.addToCart(
                            cartItem.food, cartItem.selectedAddons);
                      },
                      quantity: cartItem.quantity)
                ],
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  right: 10,
                ),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: .0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              Text(addon.name),
                              Text(
                                ' (\$${addon.price})',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                            ],
                          ),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background)),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
