import 'package:flutter/material.dart';
import 'package:flutter_streams_lab/data/models/ingredient.dart';
import 'package:flutter_streams_lab/data/repositories/repository.dart';

class GroceriesScreen extends StatefulWidget {
  final Repository repository;

  const GroceriesScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  late List<Ingredient> currentIngredients = [];
  late Stream<List<Ingredient>> ingredientStream;

  @override
  void initState() {
    super.initState();
    ingredientStream = widget.repository.watchAllIngredients();
    ingredientStream.listen((ingredients) {
      setState(() {
        currentIngredients = ingredients;
      });
    });
  }

  void startSearch(String searchString) {
    setState(() {
      currentIngredients = currentIngredients
          .where((ingredient) => ingredient.name.contains(searchString))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentIngredients.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(currentIngredients[index].name),
        );
      },
    );
  }
}
