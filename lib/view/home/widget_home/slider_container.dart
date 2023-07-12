import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderContainer extends StatelessWidget {
  const SliderContainer({
    required String image,
    super.key,
  }):_image = image;
  final String  _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right: Get.height / 55.030),
      width: Get.width / 1.262,
      height: Get.height / 5.159,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.height / 55.030),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            _image,
          ),
        ),
      ),
    );
  }
}
