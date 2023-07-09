import 'package:flutter/material.dart';

class SocialElevatedButtonWidget extends StatelessWidget {
  const SocialElevatedButtonWidget({
    super.key,
    required Function()? onPressed,
    required String text,
    required Image image,
  })  : _onPressed = onPressed,
        _text = text,
        _image = image;
  final Function()? _onPressed;
  final String _text;
  final Image _image;

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
          color: Color(0XFFE3E3E3), // the color of the border
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            height / 68.787,
          ),
        ),
      ),
      onPressed: _onPressed,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: height / 41.272),
            child: _image,
          ),
          SizedBox(
            width: width / 7.700,
          ),
          Text(
            _text,
            style: TextStyle(
              fontSize: height / 58.961,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF161616),
            ),
          ),
        ],
      ),
    );
  }
}
