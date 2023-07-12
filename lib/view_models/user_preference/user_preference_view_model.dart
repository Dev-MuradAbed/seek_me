import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login/user_model.dart';

class UserPreference {
  Future<bool> saveUser(UserModel responseModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setBool('isLogin', responseModel.isLogin!);

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final bool? isLogin = sp.getBool('isLogin');

    return UserModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
