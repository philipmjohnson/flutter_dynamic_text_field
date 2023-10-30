import 'package:flutter/material.dart';

/// last textfield will have an add button, tapping which will add a new textfield below
/// and all other textfields will have a remove button, tapping which will remove the textfield at the index
class TextFieldButton(int index, List<String> friendsList, VoidCallback onTap) extends StatelessWidget {
  bool isLast = index == friendsList.length - 1;

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
