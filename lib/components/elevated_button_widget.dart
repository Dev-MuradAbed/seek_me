import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required Function()? onPressed,
    required String text,
  })  : _onPressed = onPressed,
        _text = text;
  final Function()? _onPressed;
  final String _text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.all(
          height / 68.787,
        ),
        backgroundColor: Colors.white,
        side: const BorderSide(
            width: 1, // the thickness
            color: Color(
              0XFFE3E3E3,
            ) // the color of the border
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 68.787),
        ),
      ),
      onPressed: _onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width / 3.192,
          vertical: height / 91.717,
        ),
        child: Text(_text),
      ),
    );
  }
}
