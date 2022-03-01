import 'package:flutter/material.dart';
import '../models/my_recipe.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class BottumNavigationScreen extends StatefulWidget {
  final List<MyRecipe> favorite;
  const BottumNavigationScreen({required this.favorite, Key? key})
      : super(key: key);

  @override
  _BottumNavigationScreenState createState() => _BottumNavigationScreenState();
}

class _BottumNavigationScreenState extends State<BottumNavigationScreen> {
  List<Map<String, Object>> _selectedScreen = [];
  int _selectedTab = 0;
  @override
  void initState() {
    _selectedScreen = [
      {
        'title': 'Categories',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(favorite: widget.favorite),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedScreen[_selectedTab]['title'] as String),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: (newTab) => setState(() => _selectedTab = newTab),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
      body: _selectedScreen[_selectedTab]['screen'] as Widget,
    );
  }
}
