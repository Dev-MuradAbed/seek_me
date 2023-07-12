import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../api/index.dart';
import '../../index.dart';
import 'index.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      ApiRequest(
          className: 'getNetworkApiServices', path: '', withLoading: true);

      // final http.Response response =
      //     await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      // responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    ApiRequest(
      formatResponse: true,
      method: ApiMethods.post,
      className: 'getNetworkApiServices',
      path: url,
      withLoading: true,
      body: data,
    ).request(
      onSuccess: (dynamic data, dynamic response) {},
    );
  }
}
