import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../index.dart';

class TrendingServicesSection extends StatelessWidget {
  const TrendingServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width/24.545),
        child: Wrap(
          spacing: 22,
          children: List<Widget>.generate(
              3,
                  (int index) => Stack(
                children: <Widget>[
                  Container(
                    width: Get.width/1.745,
                    height: Get.height/5.503,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Get.height/33.018),
                      image: const DecorationImage(
                          image: AssetImage(
                              ImageAssets.hearImageTest),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: Get.width/1.745,
                    height: Get.height/5.503,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Get.height/33.018),
                        color: const Color.fromRGBO(
                            0, 0, 0, 0.2)),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: Get.height/6.603, left: Get.width/26.181),
                    child: Text(
                      'Hair services for men',
                      style: TextStyle(
                          fontSize: Get.height/58.961,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
