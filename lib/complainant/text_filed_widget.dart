import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required TextEditingController nameController,
      required String hintText})
      : _nameController = nameController,
        _hintText = hintText;

  final TextEditingController _nameController;
  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.purpleAccent),
              borderRadius: BorderRadius.circular(12)),
          hintText: _hintText,
          hintStyle: const TextStyle(color: Color(0xFF79747E))),
    );
  }
}
