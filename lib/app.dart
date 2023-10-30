import 'package:flutter/material.dart';
import 'package:flutter_dynamic_text_field/text_field_button.dart';

import 'dynamic_text_field.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  final _formKey = GlobalKey<FormState>();
  final friendsList = [''];

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
                        index: index,
                        friendsList: friendsList,
                        isLast: index == friendsList.length - 1,
                        onTap: () => setState(
                              () => (index == friendsList.length - 1)
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
                    print('on Submit: friendsList is: $friendsList');
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
