import 'package:flutter/material.dart';

/// Builds the button displayed to the left of each text field.
/// It is either an Add or Remove button depending on value of isAdd.
class DynamicTextFieldButton extends StatelessWidget {
  const DynamicTextFieldButton(
      {super.key, required this.onTap, required this.isAdd});

  final VoidCallback onTap;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isAdd ? Colors.green : Colors.red,
        ),
        child: Icon(
          isAdd ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
