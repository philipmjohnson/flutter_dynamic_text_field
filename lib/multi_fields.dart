import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dynamic_text_field.dart';
import 'text_field_button.dart';

class MultiFields extends StatefulWidget {
  const MultiFields({super.key, required this.formKey});

  final GlobalKey<FormBuilderState> formKey;

  @override
  State<MultiFields> createState() => _MultiFieldsState();
}

class _MultiFieldsState extends State<MultiFields> {
  final fieldValues = [''];
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
              onChanged: (v) => fieldValues[index] = v,
            ),
          ),
          const SizedBox(width: 20),
          TextFieldButton(
              index: index,
              friendsList: fieldValues,
              isLast: index == fieldValues.length - 1,
              onTap: () => setState(
                    () => (index == fieldValues.length - 1)
                        ? fieldValues.add('')
                        : fieldValues.removeAt(index),
                  )),
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
