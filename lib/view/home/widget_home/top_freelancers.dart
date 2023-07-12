import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../index.dart';

class TopFreelancers extends StatelessWidget {
  const TopFreelancers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 3.573,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 24.545),
          child: Row(
            children: List<Widget>.generate(
                3,
                (int index) => Padding(
                      padding:
                          EdgeInsetsDirectional.only(end: Get.width / 17.851),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Container(
                            width: Get.width / 2.805,
                            height: Get.height / 5.159,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Get.width / 33.018),
                                color: Colors.white
                                // Color(0xFFF3F3F3)
                                ),
                          ),
                          Positioned(
                              bottom: Get.height / 6.603,
                              left: Get.width / 26.181,
                              right: Get.width / 26.181,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width / 19.636),
                                child: Container(
                                  height: Get.height / 11.792,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: Get.height / 206.363),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const ClipOval(
                                    child: Image(
                                        image: AssetImage(
                                            ImageAssets.categoriesImageTest),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )),
                          Positioned(
                              top: Get.height / 20.636,
                              child: SizedBox(
                                width: Get.width / 2.805,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text('Jack Harlow'),
                                        SvgPicture.asset(
                                            ImageAssets.documented),
                                      ],
                                    ),
                                    const Text('Electrician'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: Get.width / 24.545,
                                          color: const Color(0xFFF5C443),
                                        ),
                                        const Text('4.5')
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF5E17EB),
                                      ),
                                      child: const Text(
                                        'view profile',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
