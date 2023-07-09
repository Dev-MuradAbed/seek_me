import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required String hintText,
  }) : _hintText = hintText;
  final String _hintText;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      _hintText,
      style: TextStyle(
        fontSize: height / 68.787,
        // fontFamily = FontFamily(Font(R.font.sf pro)),
        fontWeight: FontWeight.w400,
        color: const Color(0xFF757575),
      ),
    );
  }
}
