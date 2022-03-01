import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Map<String, bool> filters;
  final Function(Map<String, bool>) action;
  const SettingsScreen({required this.filters, required this.action, Key? key})
      : super(key: key);

  static const String routeName = '/settings-screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isGlutenFree;
  var _isLactoseFree;
  var _isVegan;
  var _isVegetarian;

  @override
  void initState() {
    _isGlutenFree = widget.filters['Gluten'];
    _isLactoseFree = widget.filters['Lactose'];
    _isVegan = widget.filters['Vegan'];
    _isVegetarian = widget.filters['Vegetarian'];
    super.initState();
  }

  void _savaData() {
    Map<String, bool> newFilters = {
      'Gluten': _isGlutenFree,
      'Lactose': _isLactoseFree,
      'Vegan': _isVegan,
      'Vegetarian': _isVegetarian,
    };
    widget.action(newFilters);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saved Changes !', textAlign: TextAlign.center,),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: _savaData,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Adjust your recipe selection!',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: const Text('Gluten Free'),
              value: _isGlutenFree,
              onChanged: (newValue) => setState(
                () => _isGlutenFree = newValue,
              ),
              subtitle: const Text('Only include gluten free recipe'),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: const Text('Lactose Free'),
              value: _isLactoseFree,
              onChanged: (newValue) => setState(
                () => _isLactoseFree = newValue,
              ),
              subtitle: const Text('Only include lactose free recipe'),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: const Text('Vegan'),
              value: _isVegan,
              onChanged: (newValue) => setState(
                () => _isVegan = newValue,
              ),
              subtitle: const Text('Only include Vegan recipe'),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: const Text('Vegetarian'),
              value: _isVegetarian,
              onChanged: (newValue) => setState(
                () => _isVegetarian = newValue,
              ),
              subtitle: const Text('Only include vegetarian recip'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Don\'t forget to save changes',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
