import 'package:flutter/material.dart';
import '../models/my_recipe.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TopNavigationScreen extends StatelessWidget {
  final List<MyRecipe> favorite;
  const TopNavigationScreen({required this.favorite,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Recipes'),
          bottom: const TabBar(
              labelColor: Colors.amber,
              labelStyle: TextStyle(fontSize: 16),
              indicatorColor: Colors.amber,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: 'Favorites',
                )
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            const CategoriesScreen(),
            FavoriteScreen(favorite: favorite),
          ],
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
