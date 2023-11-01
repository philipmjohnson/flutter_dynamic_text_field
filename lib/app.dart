import 'package:flutter/material.dart';

import 'recipe_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic TextFormFields')),
      body: const RecipeForm(),
    );
  }
}
