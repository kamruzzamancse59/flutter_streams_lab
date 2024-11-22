import 'package:flutter/material.dart';
import 'package:flutter_streams_lab/data/repositories/memory_repository.dart';
import 'ui/bookmarks/bookmarks.dart';
import 'ui/groceries/groceries.dart';
import 'package:flutter_streams_lab/ui/bookmarks/bookmarks_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repository = MemoryRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Streams Lab"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Bookmarks"),
                Tab(text: "Groceries"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BookmarksScreen(repository: repository),
              GroceriesScreen(repository: repository),
            ],
          ),
        ),
      ),
    );
  }
}
