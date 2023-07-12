import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../index.dart';
import 'index.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F3),
      height: Get.height / 14.481,
      child: Padding(
        padding:  EdgeInsets.only(top: Get.height / 82.54, left: Get.width / 24.545, right: Get.width / 24.545),
        child: Row(
          children: <Widget>[
            const ContainerIcons(
                color: Color(0xFFF5C443), icon: ImageAssets.profileImage),
            SizedBox(
              width: Get.width / 79.545,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                        text: 'Hi, ',
                        style: TextStyle(
                            fontSize: Get.width / 24.545,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: const <TextSpan>[TextSpan(text: 'Murad')])),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      IconAssets.locationImage,
                      height: Get.height / 45.858,
                      width: Get.width / 21.818 ,
                    ),
                    Text(
                      'Ayodhya Nagar, Bhopal',
                      style: TextStyle(
                          fontSize: Get.width / 32.727,
                          color: const Color(0xFF161616)),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            const ContainerIcons(
              color: Colors.white,
              icon: IconAssets.billImage,
              isSvg: true,
            ),
          ],
        ),
      ),
    );
  }
}
