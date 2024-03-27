import 'package:advanced_bakery/components/receipt.dart';
import 'package:advanced_bakery/model/bakery.dart';
import 'package:advanced_bakery/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();
  @override
  void initState() {
    super.initState();
    String receipt = context.read<Bakery>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in progress..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: const Column(
        children: [
          Receipt(),
        ],
      ),
    );
  }
}

Widget _buildBottomNavbar(BuildContext context) {
  return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Driver's Name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              "Driver",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                color: Colors.lightGreen,
              ),
            ),
          ],
        )
      ]));
}
