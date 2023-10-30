import 'package:flutter/material.dart';

class DynamicTextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onChanged;

  const DynamicTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
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
      decoration: const InputDecoration(hintText: "Enter your friend's name"),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
