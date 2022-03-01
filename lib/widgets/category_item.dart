import 'package:flutter/material.dart';
import '../models/my_category.dart';
import '../screens/recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final MyCategory _item;
  const CategoryItem(this._item, {Key? key}) : super(key: key);

  void selectedCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecipeScreen.routeNamte, arguments: _item
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_item.color.withOpacity(0.7), _item.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            _item.title,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );
  }
}
