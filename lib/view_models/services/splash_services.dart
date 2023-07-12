import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../models/login/user_model.dart';
import '../../res/routes/routes_name.dart';
import '../user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((UserModel value) {
      if (kDebugMode) {
        print(value.token);
        print(value.isLogin);
      }

      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
      }
    });
  }
}
