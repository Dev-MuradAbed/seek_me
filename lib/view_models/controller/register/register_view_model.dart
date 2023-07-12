import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/register_repoaitory/register_repoasitery.dart';
import '../../../utils/utils.dart';
import '../../../view/OTP/index.dart';

class RegisterViewModel extends GetxController {
  final RegisterRepository _api = RegisterRepository();

  final Rx<TextEditingController> phoneController = TextEditingController().obs;
  final Rx<TextEditingController> mobileCodeController =
      TextEditingController().obs;

  final Rx<FocusNode> phoneFocusNode = FocusNode().obs;
  final Rx<FocusNode> mobileCodeFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void registerApi() {
    loading.value = true;
    final Map<String, dynamic> data = <String, dynamic>{
      'mobile_number': phoneController.value.text.split('+').join(),
      'mobile_code': mobileCodeController.value.text
    };
    _api.registerApi(data).then((dynamic value) async {
      await Future.delayed(const Duration(seconds: 3))
          .then((dynamic value) => Get.to(OTPScreen()));
      loading.value = false;
    }).onError((Object? error, StackTrace stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
