import 'package:flutter/material.dart';

class DynamicTextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onChanged;
  final TextEditingController _controller = TextEditingController();

  DynamicTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  @override
  void initState() {
    super.initState();
    widget._controller.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      onChanged: widget.onChanged,
    );
  }
}
