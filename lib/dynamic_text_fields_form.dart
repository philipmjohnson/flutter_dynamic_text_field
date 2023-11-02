import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'multi_fields.dart';

class DynamicTextFieldsForm extends StatelessWidget {
  const DynamicTextFieldsForm({super.key, required this.formKey});

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
        name: 'Dynamic TextFields',
        builder: (FormFieldState field) {
          return MultiFields(formKey: formKey, didChange: field.didChange);
        });
  }
}
