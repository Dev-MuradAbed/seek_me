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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(
          12,
        ),
        backgroundColor: Colors.white,
        side: const BorderSide(
            width: 1, // the thickness
            color: Color(
              0XFFE3E3E3,
            ) // the color of the border
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: _onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 123,
          vertical: 9,
        ),
        child: Text(_text),
      ),
    );
  }
}
