import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/index.dart';

class SectionOfCategories extends StatelessWidget {
  const SectionOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text("Section Salon for Women",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=>Get.back(),
        ),
      ),
      body: SectionOfCategoriesWidget(),
    );
  }
}
