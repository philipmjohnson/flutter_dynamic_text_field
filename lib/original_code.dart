// import 'package:flutter/material.dart';
//
// void main() => runApp(const MaterialApp(home: DynamicTextfieldsApp()));
//
// class DynamicTextfieldsApp extends StatefulWidget {
//   const DynamicTextfieldsApp({super.key});
//
//   @override
//   State createState() => _DynamicTextfieldsAppState();
// }
//
// class _DynamicTextfieldsAppState extends State {
//   final _formKey = GlobalKey();
//   final List _friendsList = [''];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dynamic TextFormFields')),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.separated(
//                 itemCount: _friendsList.length,
//                 padding: const EdgeInsets.all(20),
//                 itemBuilder: (context, index) => Row(
//                   children: [
//                     Expanded(
//                       child: DynamicTextfield(
//                         key: UniqueKey(),
//                         initialValue: _friendsList[index],
//                         onChanged: (v) => _friendsList[index] = v,
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     _textfieldBtn(index),
//                   ],
//                 ),
//                 separatorBuilder: (context, index) => const SizedBox(
//                   height: 20,
//                 ),
//               ),
//             ),
//             // submit button
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     print(_friendsList);
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// last textfield will have an add button, tapping which will add a new textfield below
//   /// and all other textfields will have a remove button, tapping which will remove the textfield at the index
//   Widget _textfieldBtn(int index) {
//     bool isLast = index == _friendsList.length - 1;
//
//     return InkWell(
//       onTap: () => setState(
//             () => isLast ? _friendsList.add('') : _friendsList.removeAt(index),
//       ),
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         width: 30,
//         height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: isLast ? Colors.green : Colors.red,
//         ),
//         child: Icon(
//           isLast ? Icons.add : Icons.remove,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
//
// class DynamicTextfield extends StatefulWidget {
//   final String? initialValue;
//   final void Function(String) onChanged;
//
//   const DynamicTextfield({
//     super.key,
//     this.initialValue,
//     required this.onChanged,
//   });
//
//   @override
//   State createState() => _DynamicTextfieldState();
// }
//
// class _DynamicTextfieldState extends State {
//   late final TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//     _controller.text = widget.initialValue ?? '';
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: _controller,
//       onChanged: widget.onChanged,
//       decoration: const InputDecoration(hintText: "Enter your friend's name"),
//       validator: (v) {
//         if (v == null || v.trim().isEmpty) return 'Please enter something';
//         return null;
//       },
//     );
//   }
// }
