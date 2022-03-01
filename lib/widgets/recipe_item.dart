import 'package:flutter/material.dart';
import '../screens/recipe_detail_screen.dart';
import '../models/my_recipe.dart';

class RecipeItem extends StatelessWidget {
  final MyRecipe recipe;
  final Function() favoriteRecipeHandler;
  const RecipeItem({required this.recipe, required this.favoriteRecipeHandler, Key? key}) : super(key: key);

  String get complexityText {
    switch (recipe.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affodibilityText {
    switch (recipe.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  Widget iconWithText({required icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        const SizedBox(width: 5),
        FittedBox(
          child: Text(
            text,
            style: const TextStyle(fontFamily: 'OpenSans'),
          ),
        )
      ],
    );
  }

  void selectRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecipeDetailScreen.routeName,
      arguments: recipe,
    ).then((value){
      if (value != null) {
        favoriteRecipeHandler();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectRecipe(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    recipe.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text(
                        recipe.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWithText(
                    icon: Icons.schedule,
                    text: '${recipe.duration} min',
                  ),
                  iconWithText(
                    icon: Icons.settings,
                    text: complexityText,
                  ),
                  iconWithText(
                    icon: Icons.attach_money,
                    text: affodibilityText,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
