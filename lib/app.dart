import 'package:flutter/material.dart';
import 'package:flutter_dynamic_text_field/recipe_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dynamic Text Field Example')),
        body: const RecipeForm());
  }
}
