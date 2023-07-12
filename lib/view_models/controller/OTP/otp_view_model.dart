import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/otp_repoaitory/otp_repoasitery.dart';
import '../../../utils/utils.dart';

class OtpViewModel extends GetxController {
  final OTPRepository _api = OTPRepository();

  final Rx<TextEditingController> otpController0 = TextEditingController().obs;
  final Rx<TextEditingController> otpController1 = TextEditingController().obs;
  final Rx<TextEditingController> otpController2 = TextEditingController().obs;
  final Rx<TextEditingController> otpController3 = TextEditingController().obs;
  final Rx<FocusNode> otpFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void verifyOtp() {
    loading.value = true;
    final Map<String, dynamic> data = <String, dynamic>{
      'mobile_number': '966595131066',
      'mobile_code': '966',
      'otp':
          '${otpController0.value.text}${otpController1.value.text}${otpController2.value.text}${otpController3.value.text}',
    };
    _api.otpApi(data).then((dynamic value) {
      loading.value = false;
    }).onError((Object? error, StackTrace stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
