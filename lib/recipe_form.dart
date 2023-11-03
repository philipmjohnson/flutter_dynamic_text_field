import 'package:flutter/material.dart';
import 'package:flutter_dynamic_text_field/submit_button.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic-text-field/dynamic_text_field.dart';

/// A simple example of using the DynamicTextField widget.
class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});
  final String fieldName = 'Recipe Items';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    void onPressed() {
      if (formKey.currentState!.saveAndValidate()) {
        // ignore: avoid_print
        print('on Submit: ${formKey.currentState!.value[fieldName]}');
      }
    }

    return FormBuilder(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 10),
                DynamicTextField(name: fieldName),
                const SizedBox(height: 10),
                SubmitButton(onPressed: onPressed),
              ])),
    );
  }
}
