import 'package:flutter/material.dart';
import 'package:flutter_dynamic_text_field/text_field_button.dart';

import 'dynamic_text_field.dart';

class DynamicTextFieldsApp extends StatefulWidget {
  const DynamicTextFieldsApp({super.key});

  @override
  State createState() => DynamicTextFieldsAppState();
}

class DynamicTextFieldsAppState extends State<DynamicTextFieldsApp> {
  final _formKey = GlobalKey<FormState>();
  final List<String> friendsList = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic TextFormFields')),
      body: Form(
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
                        index,
                        friendsList,
                        () => setState(
                              () => isLast
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
                    print(friendsList);
                  }
                },
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
