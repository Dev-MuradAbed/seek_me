import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../index.dart';
import '../section_of_categories.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width/24.545,vertical: Get.width/24.545,),
        child: Wrap(
          runSpacing: Get.width/17.851,
          spacing: Get.width/17.851,
          children:List<Widget>.generate(10, (int index) => GestureDetector(
            onTap: (){
Get.to(SectionOfCategories());
            },
            child: Container(
              width: Get.width/2.394,
              height: Get.height/3.383,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF3F3F3),width: Get.width/130.909),
                borderRadius: BorderRadius.circular(Get.height/41.272),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(Get.width/24.545),
                    child: Container(
                      width: Get.width/1.761,
                      height: Get.height/5.577,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(image: AssetImage(ImageAssets.categoriesImageTest),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(Get.height/41.272),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: Get.width/39.272),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Facial for glow',style: TextStyle(fontSize: Get.width/24.545,fontWeight: FontWeight.w600),),
                        Text('₹599 onwards',style: TextStyle(fontSize: Get.width/28.051,fontWeight: FontWeight.bold,color: Color(0xFF5E17EB)),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),)
        ),
      ),
    );
  }
}
