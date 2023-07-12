import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required String hintText,
    required TextInputAction textInputAction,
     TextEditingController? nameController,

    super.key,
  })  : _nameController = nameController,
        _hintText = hintText,
        _textInputAction = textInputAction;

  final TextEditingController? _nameController;
  final String _hintText;
  final TextInputAction _textInputAction;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return TextField(
      textInputAction: _textInputAction,
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
