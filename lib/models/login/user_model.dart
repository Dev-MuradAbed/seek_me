class UserModel {
  UserModel({this.token, this.isLogin});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }
  String? token;
  bool? isLogin;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['isLogin'] = token;
    return data;
  }
}
