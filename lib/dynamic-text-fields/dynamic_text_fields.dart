import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'dynamic_text_fields_internal.dart';

// A wrapper around DynamicTextFieldsInternal that uses FormBuilderField
class DynamicTextFields extends StatelessWidget {
  const DynamicTextFields(
      {super.key, required this.formKey, required this.name});

  final GlobalKey<FormBuilderState> formKey;
  final String name;

  String? validator(List<String>? values) {
    print('in validator: $values');
    return (values?.isEmpty ?? true)
        ? 'Please enter at least one ingredient'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
        name: name,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        builder: (FormFieldState field) {
          return InputDecorator(
              decoration: InputDecoration(
                labelText: "Select option",
                contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
                border: InputBorder.none,
                errorText: field.errorText,
              ),
              child: DynamicTextFieldsInternal(
                  formKey: formKey, didChange: field.didChange));
        });
  }
}
