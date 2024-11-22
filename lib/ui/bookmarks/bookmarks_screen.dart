import 'package:flutter/material.dart';
import 'package:flutter_streams_lab/data/models/recipe.dart';
import 'package:flutter_streams_lab/data/repositories/repository.dart';

class BookmarksScreen extends StatelessWidget {
  final Repository repository;

  const BookmarksScreen({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
      ),
      body: StreamBuilder<List<Recipe>>(
        stream: repository.watchAllRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final recipes = snapshot.data ?? [];
          if (recipes.isEmpty) {
            return const Center(
              child: Text(
                'No bookmarks found.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                child: ListTile(
                  title: Text(
                    recipe.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${recipe.ingredients.length} ingredients',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    // Action when a recipe is tapped
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped on ${recipe.name}')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
