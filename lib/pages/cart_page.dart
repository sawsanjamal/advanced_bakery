import 'package:advanced_bakery/components/model/bakery.dart';
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
            title: Text("Cart"),
          ),
        );
      },
    );
  }
}
