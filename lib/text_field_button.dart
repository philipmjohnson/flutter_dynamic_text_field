import 'package:flutter/material.dart';

class TextFieldButton extends StatelessWidget {
  const TextFieldButton(
      {super.key,
      required this.index,
      required this.friendsList,
      required this.onTap,
      required this.isLast});

  final int index;
  final List<String> friendsList;
  final VoidCallback onTap;
  final bool isLast;

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
          color: isLast ? Colors.green : Colors.red,
        ),
        child: Icon(
          isLast ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
