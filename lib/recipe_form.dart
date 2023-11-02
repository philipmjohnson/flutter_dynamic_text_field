import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic-text-fields/dynamic_text_fields.dart';
import 'submit_button.dart';

class RecipeForm extends StatefulWidget {
  RecipeForm({super.key});

  final String name = 'Recipe Ingredients';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (widget._formKey.currentState?.saveAndValidate() ?? false) {
        print(
            'on Submit: ${widget._formKey.currentState?.fields[widget.name]?.value}');
      } else {
        print('on Submit: form is invalid');
      }
    }

    return FormBuilder(
      key: widget._formKey,
      child: Column(
        children: [
          Expanded(
              child: DynamicTextFields(
                  formKey: widget._formKey, name: widget.name)),
          SubmitButton(onPressed: onPressed),
        ],
      ),
    );
  }
}
