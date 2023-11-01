import 'package:flutter/material.dart';
import 'package:flutter_dynamic_text_field/submit_button.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic-text-field/dynamic_text_field.dart';

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});
  final String fieldName = 'Recipe Items';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    void onPressed() {
      if (formKey.currentState!.saveAndValidate()) {
        print('on Submit: ${formKey.currentState!.value[fieldName]}');
      }
    }

    return FormBuilder(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(child: DynamicTextField(name: fieldName)),
          SubmitButton(onPressed: onPressed)
        ]),
      ),
    );
  }
}
