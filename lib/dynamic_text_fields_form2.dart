import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic_text_field.dart';
import 'dynamic_text_field_button.dart';

class DynamicTextFieldsForm2 extends StatefulWidget {
  const DynamicTextFieldsForm2({super.key, required this.formKey});

  final GlobalKey<FormBuilderState> formKey;

  @override
  State<DynamicTextFieldsForm2> createState() => _DynamicTextFieldsForm2State();
}

class _DynamicTextFieldsForm2State extends State<DynamicTextFieldsForm2> {
  final fieldValues = [''];
  int keyOffset = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
        name: 'Dynamic TextFields',
        builder: (FormFieldState field) {
          void addFieldValueEntry() {
            setState(() => fieldValues.add(''));
            field.didChange(fieldValues);
          }

          void removeFieldValueEntry(int index) {
            setState(() => fieldValues.removeAt(index));
            setState(() => keyOffset = DateTime.now().millisecondsSinceEpoch);
            field.didChange(fieldValues);
          }

          void setFieldValueEntry(int index, String value) {
            fieldValues[index] = value;
            field.didChange(fieldValues);
          }

          return ListView.separated(
            itemCount: fieldValues.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => Row(
              children: [
                Expanded(
                  child: DynamicTextField(
                    key: GlobalObjectKey(keyOffset + index),
                    initialValue: fieldValues[index],
                    onChanged: (value) => setFieldValueEntry(index, value),
                  ),
                ),
                const SizedBox(width: 20),
                DynamicTextFieldButton(
                  isLast: index == fieldValues.length - 1,
                  onTap: () => (index == fieldValues.length - 1)
                      ? addFieldValueEntry()
                      : removeFieldValueEntry(index),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          );
        });
  }
}
