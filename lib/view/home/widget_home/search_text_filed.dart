import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height /15.008,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width / 24.545),
        child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF757575),
              ),
              hintText: 'Search for services',
              hintStyle:  TextStyle(fontSize: Get.width / 28.051),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Get.height / 68.787))),
        ),
      ),
    );
  }
}
