import 'dart:async';
import 'package:flutter_streams_lab/data/sample_data.dart';
import 'package:flutter_streams_lab/data/models/recipe.dart';
import 'package:flutter_streams_lab/data/models/ingredient.dart';
import 'repository.dart';

class MemoryRepository extends Repository {
  // Internal storage for recipes and ingredients
  final List<Recipe> _recipes = recipes; // Load initial recipes from sample_data
  final List<Ingredient> _ingredients = recipes
      .expand((recipe) => recipe.ingredients)
      .toList(); // Flatten ingredients from recipes

  // StreamControllers for recipes and ingredients
  final StreamController<List<Recipe>> _recipeStreamController =
  StreamController<List<Recipe>>.broadcast();
  final StreamController<List<Ingredient>> _ingredientStreamController =
  StreamController<List<Ingredient>>.broadcast();

  MemoryRepository() {
    // Emit initial data
    _recipeStreamController.add(_recipes);
    _ingredientStreamController.add(_ingredients);
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() => _recipeStreamController.stream;

  @override
  Stream<List<Ingredient>> watchAllIngredients() =>
      _ingredientStreamController.stream;

  @override
  Future<int> insertRecipe(Recipe recipe) async {
    if (_recipes.any((r) => r.id == recipe.id)) {
      // If the recipe already exists, return 0
      return Future.value(0);
    }

    // Add recipe to the internal list
    _recipes.add(recipe);

    // Update the recipe stream
    _recipeStreamController.add(List<Recipe>.from(_recipes));

    // Extract and add associated ingredients
    final newIngredients =
    recipe.ingredients.map((ingredient) => ingredient.copyWith(recipeId: recipe.id)).toList();
    _ingredients.addAll(newIngredients);

    // Update the ingredient stream
    _ingredientStreamController.add(List<Ingredient>.from(_ingredients));

    return Future.value(1); // Return success
  }

  @override
  void dispose() {
    // Close stream controllers when no longer needed
    _recipeStreamController.close();
    _ingredientStreamController.close();
  }
}
