import '../../data/network/index.dart';

class RegisterRepository {
  final NetworkApiServices _apiService = NetworkApiServices();

  Future<dynamic> registerApi(dynamic data) async {
    final dynamic response = await _apiService.postApi(data, '/send-otp');
    return response;
  }
}
