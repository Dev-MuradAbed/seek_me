import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required String hintText

  }):_hintText = hintText;
  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return Text(_hintText,style: TextStyle(
      fontSize : 12,
      // fontFamily = FontFamily(Font(R.font.sf pro)),
      fontWeight : FontWeight.w400,
      color : Color(0xFF757575),
    ),);
  }
}
