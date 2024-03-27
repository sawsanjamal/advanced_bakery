import 'package:advanced_bakery/components/receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in progress..."),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Receipt(),
        ],
      ),
    );
  }
}
