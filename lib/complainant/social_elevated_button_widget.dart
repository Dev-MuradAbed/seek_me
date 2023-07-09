import 'package:flutter/material.dart';

class  SocialElevatedButtonWidget extends StatelessWidget {
  const SocialElevatedButtonWidget({
    super.key,
    required Function()? onPressed,
    required String text,
    required Image image,

  }):_onPressed = onPressed,_text = text,_image = image;
  final Function()? _onPressed;
  final String _text;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.all(12),
        backgroundColor: Colors.white,
        side: const BorderSide(
            width: 1, // the thickness
            color: Color(0XFFE3E3E3) // the color of the border
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: _onPressed, child: Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: _image,
        ),
        SizedBox(width: 51,),
        Text(_text,style: TextStyle(
          fontSize : 14,
          fontWeight : FontWeight.w500,
          color : Color(0xFF161616),
        ),)
      ],
    ),
    );
  }
}
