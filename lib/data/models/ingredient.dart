class Ingredient {
  final int id;
  final String name;
  final int? recipeId; // Links the ingredient to a recipe.

  Ingredient({required this.id, required this.name, this.recipeId});

  Ingredient copyWith({int? id, String? name, int? recipeId}) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      recipeId: recipeId ?? this.recipeId,
    );
  }
}
