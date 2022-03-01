import 'package:flutter/material.dart';
import 'package:my_recipes/models/my_recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final void Function(MyRecipe) favoriteHandler;
  final bool Function(MyRecipe) isFavorite;
  const RecipeDetailScreen({required this.favoriteHandler, required this.isFavorite, Key? key})
      : super(key: key);

  static const String routeName = '/recipe-detail-screen';

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {

  var _selectedRecipe;
  _floatingButtonPress() {
    widget.favoriteHandler(_selectedRecipe);
  }

  @override
  void didChangeDependencies() {
    _selectedRecipe =
        ModalRoute.of(context)?.settings.arguments as MyRecipe;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int position = 0;

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(1);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_selectedRecipe.title),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  _selectedRecipe.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.width) * (2 / 3),
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        'Ingredients',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          ..._selectedRecipe.ingredients.map(
                            (text) => Text(
                              text,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Steps',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ..._selectedRecipe.steps.map((text) {
                        position++;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.pink,
                                child: Text('#$position',
                                    style: const TextStyle(color: Colors.white)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 64,
                                child: Text(
                                  text,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(widget.isFavorite(_selectedRecipe) ? Icons.favorite : Icons.favorite_border),
          onPressed: _floatingButtonPress,
        ),
      ),
    );
  }
}
