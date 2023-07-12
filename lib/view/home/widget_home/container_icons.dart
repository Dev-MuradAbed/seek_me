import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContainerIcons extends StatelessWidget {
  const ContainerIcons({
    required String icon,
    required Color color,
    bool isSvg = false,
    int length = 0,
    super.key,
  })  : _icon = icon,
        _color = color,
        _isSvg = isSvg,
        _length = length;
  final String _icon;
  final Color _color;
  final bool _isSvg;
  final int _length;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 18.343,
      width: Get.height / 18.343,
      decoration:
      BoxDecoration(color: _color, borderRadius: BorderRadius.circular(Get.height / 55.030)),
      child: _isSvg
          ? Padding(
        padding:  EdgeInsets.all(Get.width / 49.090),
        child: Stack(
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                _icon,
              ),
            ),
            if (_length > 0)
              Positioned(
                right: Get.width / 60,
                child: CircleAvatar(
                  radius: Get.height / 206.36,
                  backgroundColor: Colors.red,
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      )
          : Image(image: AssetImage(_icon)),
    );
  }
}
