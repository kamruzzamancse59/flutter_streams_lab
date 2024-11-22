import 'package:flutter_streams_lab/data/models/ingredient.dart';

/// Represents a recipe with a unique ID, name, and a list of ingredients.
class Recipe {
  /// Unique identifier for the recipe.
  final int id;

  /// Name of the recipe.
  final String name;

  /// List of ingredients used in the recipe.
  final List<Ingredient> ingredients;

  /// Creates a [Recipe] with the given [id], [name], and [ingredients].
  const Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
  });

  /// Returns a copy of the current [Recipe] with optional updated fields.
  Recipe copyWith({
    int? id,
    String? name,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recipe &&
        other.id == id &&
        other.name == name &&
        other.ingredients == ingredients;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ ingredients.hashCode;
}

