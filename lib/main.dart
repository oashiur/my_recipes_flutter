import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_recipes/models/my_recipe.dart';
import '../dummy_data.dart';
import './screens/settings_screen.dart';
import './screens/recipe_detail_screen.dart';
import './screens/recipe_screen.dart';
import './screens/bottom_navigation_screen.dart';
//import './screens/top_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MyRecipe> _availableRecipe = dummyRecipes;
  final List<MyRecipe> _favoriteRecipe = [];
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  void _favoriteItems(MyRecipe recipe) {
    if (_favoriteRecipe.contains(recipe)) {
      setState(() => _favoriteRecipe.remove(recipe));
    } else {
      setState(() => _favoriteRecipe.add(recipe));
    }
  }

  bool _isFavorite(MyRecipe recipe) => _favoriteRecipe.contains(recipe);

  void _setFilters(Map<String, bool> myFilters) {
    _filters = myFilters;
    _availableRecipe = dummyRecipes.where((recipe) {
      if (myFilters['Gluten'] as bool && !recipe.isGlutenFree) {
        return false;
      }
      if (myFilters['Lactose'] as bool && !recipe.isLactoseFree) {
        return false;
      }
      if (myFilters['Vegan'] as bool && !recipe.isVegan) {
        return false;
      }
      if (myFilters['Vegetarian'] as bool && !recipe.isVegetarian) {
        return false;
      } else {
        return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Colors.black87),
              bodyText2: const TextStyle(color: Colors.black87),
              caption: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
//        You can user Top Navigation Bar if you want
//        '/': (context) => TopNavigationScreen(favorite: _favoriteRecipe),
        '/': (context) => BottumNavigationScreen(favorite: _favoriteRecipe),
        RecipeScreen.routeNamte: (context) =>
            RecipeScreen(availableRecipe: _availableRecipe),
        RecipeDetailScreen.routeName: (context) => RecipeDetailScreen(
            favoriteHandler: _favoriteItems, isFavorite: _isFavorite),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(filters: _filters, action: _setFilters),
      },
    );
  }
}
