import 'package:flutter/material.dart';

// This is a TextFormField with the following customizations:
// * It has an explicitly declared and managed TextFieldController
//   following guidance in: https://api.flutter.dev/flutter/material/TextFormField-class.html
// * It also has an InputDecorator and a validator.
class DynamicTextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onChanged;

  const DynamicTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State createState() => DynamicTextFieldState();
}

class DynamicTextFieldState extends State<DynamicTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: const InputDecoration(hintText: "Enter the field value."),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return 'Fields cannot be empty.';
        return null;
      },
    );
  }
}
