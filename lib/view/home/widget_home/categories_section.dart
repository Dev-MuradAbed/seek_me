import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../index.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.width / 24.545),
      child: Wrap(
        spacing: Get.width/17.851,
        runSpacing: Get.width/17.851,
        children: List<Widget>.generate(
            6,
                (int index) => Stack(
              children: <Widget>[
                Container(
                  width: Get.width / 3.740,
                  height: Get.height /5.938,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(Get.height / 41.272)),
                ),
                Positioned(
                  top: Get.height / 82.545,
                  right: Get.height / 55.030,
                  left: Get.height / 55.030,
                  child: Container(
                    height: Get.height / 11.307,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Get.height / 41.272),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(Get.height / 41.272),
                        child: const Image(
                            image: AssetImage(ImageAssets
                                .categoriesImageTest),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                    right: Get.height / 55.030,
                    left: Get.height / 55.030,
                    top: Get.height / 9.487,
                    child: Center(
                        child: Text(
                          'Salon forWomen',
                          style: TextStyle(
                              fontSize: Get.height / 58.961,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )))
              ],
            )),
      ),
    );
  }
}
