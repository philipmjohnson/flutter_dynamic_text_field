import 'package:flutter/material.dart';

import 'dynamic_text_fields_form.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: const DynamicTextFieldsForm(),
    );
  }
}
