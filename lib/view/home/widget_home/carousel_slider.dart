import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
    required this.controller,
    required this.slidersPath,
    super.key,
  });

  final PageController controller;
  final List<String> slidersPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 4.127,
      child: SizedBox(
        height: Get.height / 4.127,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children:
          List<Widget>.generate(slidersPath.length, (int index) =>SliderContainer(image: slidersPath[index])),

        ),
      ),
    );
  }
}
