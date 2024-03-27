import 'package:advanced_bakery/components/cart_tile.dart';
import 'package:advanced_bakery/components/custom_button.dart';
import 'package:advanced_bakery/components/model/bakery.dart';
import 'package:advanced_bakery/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Bakery>(
      builder: (context, bakery, child) {
        final userCart = bakery.cart;

        return Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                    "Are you sure you want to clear your cart?"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        bakery.clearCart();
                                      },
                                      child: const Text("Yes"))
                                ],
                              ));
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty
                          ? const Expanded(
                              child: Center(child: Text("Cart is empty...")))
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: userCart.length,
                                  itemBuilder: (context, index) {
                                    final cartItem = userCart[index];
                                    return CartTile(cartItem: cartItem);
                                  }))
                    ],
                  ),
                ),
                CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(),
                          ));
                    },
                    text: "Go to checkout"),
                const SizedBox(height: 25)
              ],
            ));
      },
    );
  }
}
