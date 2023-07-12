import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    required Function()? onPressed,
    required String text,
    super.key,
  })  : _onPressed = onPressed,
        _text = text;

  final Function()? _onPressed;
  final String _text;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.all(
          height / 68.787,
        ),
        backgroundColor: const Color(0xFF5E17EB),
        side: const BorderSide(
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
        child: Text(
          _text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
