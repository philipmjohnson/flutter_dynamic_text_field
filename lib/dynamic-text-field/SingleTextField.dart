import 'package:flutter/material.dart';

class SingleTextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onChanged;

  const SingleTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends State<SingleTextField> {
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

  void updateText(String text) => _controller.text = text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) => {widget.onChanged(value), updateText(value)},
      decoration: const InputDecoration(hintText: "Enter your friend's name"),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
