import 'package:flutter/material.dart';
import '../models/my_recipe.dart';
import '../widgets/recipe_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<MyRecipe> favorite;
  const FavoriteScreen({required this.favorite, Key? key}) : super(key: key);
  static const String routeName = '/favorite-screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.favorite.isEmpty
          ? Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Your don\'t have any favorite, please add some!',
                style: TextStyle(
                  fontSize: 20,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: widget.favorite.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RecipeItem(
                      recipe: widget.favorite[index],
                      favoriteRecipeHandler: updateUI),
                );
              },
            ),
    );
  }
}
