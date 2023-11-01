import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic_text_field.dart';
import 'text_field_button.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final friendsList = [''];
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: friendsList.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) => Row(
                children: [
                  Expanded(
                    child: DynamicTextField(
                      key: UniqueKey(),
                      initialValue: friendsList[index],
                      onChanged: (v) => friendsList[index] = v,
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextFieldButton(
                      index: index,
                      friendsList: friendsList,
                      isLast: index == friendsList.length - 1,
                      onTap: () => setState(
                            () => (index == friendsList.length - 1)
                                ? friendsList.add('')
                                : friendsList.removeAt(index),
                          )),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            ),
          ),
          // submit button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  print('on Submit: friendsList is: $friendsList');
                } else {
                  print('on Submit: form is invalid');
                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
