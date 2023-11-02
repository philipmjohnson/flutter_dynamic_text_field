import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic_text_field.dart';
import 'dynamic_text_field_button.dart';

class MultiFields extends StatefulWidget {
  const MultiFields(
      {super.key, required this.formKey, required this.didChange});

  final GlobalKey<FormBuilderState> formKey;
  final Function(List<String>) didChange;

  @override
  State<MultiFields> createState() => _MultiFieldsState();
}

class _MultiFieldsState extends State<MultiFields> {
  final fieldValues = [''];

  void addFieldValueEntry() {
    setState(() => fieldValues.add(''));
    widget.didChange(fieldValues);
  }

  void removeFieldValueEntry(int index) {
    setState(() => fieldValues.removeAt(index));
    widget.didChange(fieldValues);
  }

  void setFieldValueEntry(int index, String value) {
    fieldValues[index] = value;
    widget.didChange(fieldValues);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: fieldValues.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: DynamicTextField(
              key: UniqueKey(),
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
  }
}
