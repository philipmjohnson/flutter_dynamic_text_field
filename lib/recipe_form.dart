import 'package:flutter/material.dart';
import 'package:flutter_dynamic_text_field/submit_button.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic-text-field/dynamic_text_field.dart';

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    void onPressed() {
      if (formKey.currentState!.saveAndValidate()) {
        print(formKey.currentState!.value);
      }
    }

    return FormBuilder(
      key: formKey,
      child: Column(children: [
        const Expanded(child: DynamicTextField()),
        SubmitButton(onPressed: onPressed)
      ]),
    );
  }
}
