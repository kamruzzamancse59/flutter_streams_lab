import 'models/recipe.dart';
import 'models/ingredient.dart';

final List<Recipe> recipes = [
  Recipe(
    id: 1,
    name: "Spaghetti Carbonara",
    ingredients: [
      Ingredient(id: 1, name: "Spaghetti", recipeId: 1),
      Ingredient(id: 2, name: "Eggs", recipeId: 1),
      Ingredient(id: 3, name: "Pancetta", recipeId: 1),
      Ingredient(id: 4, name: "Parmesan Cheese", recipeId: 1),
    ],
  ),
  Recipe(
    id: 2,
    name: "Vegetable Stir Fry",
    ingredients: [
      Ingredient(id: 5, name: "Broccoli", recipeId: 2),
      Ingredient(id: 6, name: "Carrots", recipeId: 2),
      Ingredient(id: 7, name: "Soy Sauce", recipeId: 2),
      Ingredient(id: 8, name: "Ginger", recipeId: 2),
    ],
  ),
  Recipe(
    id: 3,
    name: "Pancakes",
    ingredients: [
      Ingredient(id: 9, name: "Flour", recipeId: 3),
      Ingredient(id: 10, name: "Milk", recipeId: 3),
      Ingredient(id: 11, name: "Eggs", recipeId: 3),
      Ingredient(id: 12, name: "Sugar", recipeId: 3),
    ],
  ),
];
