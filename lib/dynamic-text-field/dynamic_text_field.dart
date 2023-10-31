import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic_text_field_entry_button.dart';

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({super.key, required this.name});
  final String name;

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  final fieldValuesList = [''];
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
        name: widget.name,
        builder: (FormFieldState field) {
          void onTap(int index) {
            setState(
              () {
                if (index == fieldValuesList.length - 1) {
                  fieldValuesList.add('');
                } else {
                  fieldValuesList.removeAt(index);
                }
              },
            );
            field.didChange(fieldValuesList);
          }

          void onChanged(int index, String? fieldEntryValue) {
            print(
                'onChanged: index is: $index, fieldEntryValue is: $fieldEntryValue');
            if (fieldEntryValue != null) {
              fieldValuesList[index] = fieldEntryValue;
            }
            field.didChange(fieldValuesList);
          }

          return ListView.separated(
            itemCount: fieldValuesList.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (_, index) => Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: UniqueKey().toString(),
                    // key: ValueKey(index),
                    initialValue: fieldValuesList[index],
                    onChanged: (value) => onChanged(index, value),
                  ),
                ),
                const SizedBox(width: 20),
                DynamicTextFieldEntryButton(
                    isAdd: (index == fieldValuesList.length - 1),
                    onTap: () => onTap(index)),
              ],
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
          );
        });
  }
}
