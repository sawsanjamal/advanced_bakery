import 'package:advanced_bakery/components/drawer_tile.dart';
import 'package:advanced_bakery/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(Icons.lock_open_rounded,
                size: 60, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          DrawerTile(
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              }),
          const Spacer(),
          DrawerTile(text: "Logout", icon: Icons.logout, onTap: () {}),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
