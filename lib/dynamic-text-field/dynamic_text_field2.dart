import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'dynamic_text_field_button.dart';

class DynamicTextField2 extends StatefulWidget {
  const DynamicTextField2({super.key, required this.name});
  final String name;

  @override
  State<DynamicTextField2> createState() => _DynamicTextField2State();
}

class _DynamicTextField2State extends State<DynamicTextField2> {
  final fieldValuesList = [''];
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
        name: widget.name,
        builder: (FormFieldState field) {
          void onTap(int index) {
            setState(
              () => (index == fieldValuesList.length - 1)
                  ? fieldValuesList.add('')
                  : fieldValuesList.removeAt(index),
            );
            field.didChange(fieldValuesList);
          }

          void onChanged(int index, String? fieldEntryValue) {
            fieldValuesList[index] = fieldEntryValue!;
            field.didChange(fieldValuesList);
          }

          return InputDecorator(
              decoration: InputDecoration(
                labelText: widget.name,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10.0),
                errorText: field.errorText,
              ),
              child: Column(children: [
                ...fieldValuesList.mapIndexed((index, value) => Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: UniqueKey().toString(),
                            initialValue: fieldValuesList[index],
                            onChanged: (value) => onChanged(index, value),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                        ),
                        const SizedBox(width: 20),
                        DynamicTextFieldButton(
                            isAdd: (index == fieldValuesList.length - 1),
                            onTap: () => onTap(index)),
                      ],
                    ))
              ]));
        });
  }
}
