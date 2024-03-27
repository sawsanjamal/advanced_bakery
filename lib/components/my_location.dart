import 'package:advanced_bakery/model/bakery.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text("Your location"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: "Search address..."),
          ),
          actions: [
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  textController.clear();
                },
                child: const Text("Cancel")),
            MaterialButton(
                onPressed: () {
                  String newAddress = textController.text;
                  context.read<Bakery>().updateDeliveryAddress(newAddress);
                  Navigator.pop(context);
                },
                child: const Text("Save"))
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver to",
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Bakery>(
                  builder: (context, bakery, child) => Text(
                      bakery.deliveryAddress,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
