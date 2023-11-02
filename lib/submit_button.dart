import 'package:flutter/material.dart';

/// A simple button used to trigger form validation and processing.
class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Submit'),
      ),
    );
  }
}
