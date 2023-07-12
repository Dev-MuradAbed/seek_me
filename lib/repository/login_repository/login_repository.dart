import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class LoginRepository {
  final NetworkApiServices _apiService = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    final dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
