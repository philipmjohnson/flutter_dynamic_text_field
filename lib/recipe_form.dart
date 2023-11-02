import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'SubmitButton.dart';
import 'multi_fields.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final friendsList = [''];
  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (_formKey.currentState?.saveAndValidate() ?? false) {
        print('on Submit: friendsList is: $friendsList');
        print(_formKey.currentState?.value.toString());
      } else {
        print('on Submit: form is invalid');
      }
    }

    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Expanded(child: MultiFields(formKey: _formKey)),
          SubmitButton(onPressed: onPressed),
        ],
      ),
    );
  }
}
