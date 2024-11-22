import 'package:flutter_streams_lab/data/models/recipe.dart';
import 'package:flutter_streams_lab/data/models/ingredient.dart';
import 'package:flutter_streams_lab/data/sample_data.dart';



abstract class Repository {
  Stream<List<Recipe>> watchAllRecipes();
  Stream<List<Ingredient>> watchAllIngredients();
  Future<int> insertRecipe(Recipe recipe);
}
