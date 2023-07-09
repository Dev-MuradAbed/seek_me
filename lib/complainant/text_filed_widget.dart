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
    double height = MediaQuery.of(context).size.height;
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            height / 68.787,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            height / 68.787,
          ),
        ),
        hintText: _hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF79747E),
        ),
      ),
    );
  }
}
