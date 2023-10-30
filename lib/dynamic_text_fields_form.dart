import 'package:flutter/material.dart';

import 'add_or_delete_button.dart';
import 'dynamic_text_field.dart';

// A form consisting of a dynamically modifiable ListView of TextFields.
// The state is a list of strings representing the values of the current TextFields.
// Uses a ListView.itemBuilder to create a form field for each item in the state.
// isAdd is true only for the last field in the list. This means the button
// following the text field is a "delete" button for all fields other than the
// last one.
// This approach means there must be a minimum of one text field.
class DynamicTextFieldsForm extends StatefulWidget {
  const DynamicTextFieldsForm({super.key});

  @override
  State<DynamicTextFieldsForm> createState() => _DynamicTextFieldsFormState();
}

class _DynamicTextFieldsFormState extends State<DynamicTextFieldsForm> {
  final _formKey = GlobalKey<FormState>();
  final fieldValuesList = [''];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: fieldValuesList.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (_, index) => Row(
                children: [
                  Expanded(
                    child: DynamicTextField(
                      key: UniqueKey(),
                      initialValue: fieldValuesList[index],
                      onChanged: (v) => fieldValuesList[index] = v,
                    ),
                  ),
                  const SizedBox(width: 20),
                  AddOrDeleteButton(
                      isAdd: (index == fieldValuesList.length - 1),
                      onTap: () => setState(
                            () => (index == fieldValuesList.length - 1)
                                ? fieldValuesList.add('')
                                : fieldValuesList.removeAt(index),
                          ))
                ],
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 20),
            ),
          ),
          // submit button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // ignore: avoid_print
                  print('on Submit: fieldValuesList is: $fieldValuesList');
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
