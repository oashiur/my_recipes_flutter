import 'package:flutter/material.dart';
import '../widgets/recipe_item.dart';
import '../models/my_category.dart';
import '../models/my_recipe.dart';

class RecipeScreen extends StatefulWidget {
  static const routeNamte = '/recipe_screen';
  final List<MyRecipe> availableRecipe;
  const RecipeScreen({required this.availableRecipe, Key? key})
      : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  var _routeRef;
  var _categoryRecipe;
  bool _loadInitData = true;

  @override
  void didChangeDependencies() {
    if (_loadInitData) {
      _routeRef = ModalRoute.of(context)?.settings.arguments as MyCategory;
      _categoryRecipe = widget.availableRecipe
          .where(
            (recipe) => recipe.categoryIds.contains(_routeRef.id),
          )
          .toList();
      _loadInitData = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_routeRef.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _categoryRecipe.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: RecipeItem(recipe: _categoryRecipe[index], favoriteRecipeHandler: (){}),
            );
          },
        ),
      ),
    );
  }
}
