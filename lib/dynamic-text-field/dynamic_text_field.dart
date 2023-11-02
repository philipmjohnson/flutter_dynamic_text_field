import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'dynamic_text_field_button.dart';

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({super.key, required this.name});
  final String name;

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  final fieldValuesList = [''];
  int keyOffset = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
        name: widget.name,
        builder: (FormFieldState field) {
          void addFieldValueEntry() {
            setState(() => fieldValuesList.add(''));
            field.didChange(fieldValuesList);
          }

          void removeFieldValueEntry(int index) {
            setState(() {
              fieldValuesList.removeAt(index);
              keyOffset = DateTime.now().millisecondsSinceEpoch;
            });
            field.didChange(fieldValuesList);
          }

          void setFieldValueEntry(int index, String? value) {
            fieldValuesList[index] = value ?? '';
            field.didChange(fieldValuesList);
          }

          return InputDecorator(
              decoration: InputDecoration(
                labelText: widget.name,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10.0),
                errorText: field.errorText,
              ),
              child: ListView.separated(
                itemCount: fieldValuesList.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (_, index) => Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        key: GlobalObjectKey(keyOffset + index),
                        name: UniqueKey().toString(),
                        initialValue: fieldValuesList[index],
                        onChanged: (value) => setFieldValueEntry(index, value),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                    const SizedBox(width: 20),
                    DynamicTextFieldButton(
                        isAdd: (index == fieldValuesList.length - 1),
                        onTap: () => (index == fieldValuesList.length - 1)
                            ? addFieldValueEntry()
                            : removeFieldValueEntry(index)),
                  ],
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 20),
              ));
        });
  }
}
