import 'package:flutter/material.dart';
import 'package:my_recipes/screens/favorite_screen.dart';
import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      {required String title,
      required IconData icon,
      required void Function() tapHandler}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.amber,
              child: const Text(
                'Keep Cooking!',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.center,
            ),
            buildListTile(
              title: 'Categories',
              icon: Icons.restaurant,
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            buildListTile(
              title: 'Settings',
              icon: Icons.settings,
              tapHandler: () {
                Navigator.of(context)
                    .pushReplacementNamed(SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
