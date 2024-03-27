import 'package:advanced_bakery/components/description_box.dart';
import 'package:advanced_bakery/components/model/bakery.dart';
import 'package:advanced_bakery/components/model/food.dart';
import 'package:advanced_bakery/components/my_baked_goods_tile.dart';
import 'package:advanced_bakery/components/my_drawer.dart';
import 'package:advanced_bakery/components/my_location.dart';
import 'package:advanced_bakery/components/sliver_appbar.dart';
import 'package:advanced_bakery/components/tab_bar.dart';
import 'package:advanced_bakery/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return BakedGoods(
              food: food,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(food: food),
                  )));
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: CustomTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  const MyLocation(),
                  const DescriptionBox(),
                  const SizedBox(height: 25)
                ],
              )),
        ],
        body: Consumer<Bakery>(
          builder: (context, bakery, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(bakery.menu)),
        ),
      ),
    );
  }
}
