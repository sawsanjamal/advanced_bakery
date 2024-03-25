import 'package:advanced_bakery/components/description_box.dart';
import 'package:advanced_bakery/components/my_drawer.dart';
import 'package:advanced_bakery/components/my_location.dart';
import 'package:advanced_bakery/components/sliver_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                    title: const Text("title"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const MyLocation(),
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const DescriptionBox(),
                      ],
                    )),
              ],
          body: Container(color: Colors.blue)),
    );
  }
}
