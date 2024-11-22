import 'package:flutter/material.dart';
import 'package:flutter_streams_lab/data/sample_data.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipes")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            subtitle: Text("Ingredients: ${recipe.ingredients.length}"),
          );
        },
      ),
    );
  }
}
