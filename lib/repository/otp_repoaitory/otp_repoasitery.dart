import '../../data/network/index.dart';

class OTPRepository {
  final NetworkApiServices _apiService = NetworkApiServices();

  Future<dynamic> otpApi(dynamic data) async {
    final dynamic response = await _apiService.postApi(data, '/verify-otp');
    return response;
  }
}
