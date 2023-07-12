import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';
import '../res/helpar.dart';

// import '../general_exports.dart';

class ApiRequest {
  ApiRequest({
    required this.className,
    this.requestFunction,
    this.path,
    this.fullUrl,
    this.method = ApiMethods.get,
    this.header,
    this.body,
    this.queryParameters,
    this.formatResponse = false,
    this.withLoading = false,
    this.shouldShowMessage = true,
  });

  final String? path;
  final String? fullUrl;
  final ApiMethods method;
  final String? className;
  final Map<String, dynamic>? header;
  // String authorization() => myAppController.userData != null
  //     ? 'Bearer ${myAppController.userData['token']}'
  //     : '';
  final bool withLoading;
  final bool formatResponse;
  final bool shouldShowMessage;
  final dynamic body;
  final dynamic queryParameters;
  dynamic response;
  final Function? requestFunction;

  Dio _dio() {
    // Put your authorization token here
    return Dio(
      BaseOptions(
        headers: <String, dynamic>{
          // 'Authorization': authorization(),
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Device-Type': 'MOBILE',
          // 'Accept-Language': Get.find<AppLanguageController>().appLocale,
          ...(header ?? <String, dynamic>{}),
        },
        queryParameters: <String, dynamic>{
          // 'template_id': getTemplateId(),
          ...queryParameters ?? <String, dynamic>{},
        },
      ),
    );
  }

  Future<void> request({
    Function()? beforeSend,
    Function(dynamic data, dynamic response)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    // start request time
    final Stopwatch stopwatch = Stopwatch()..start();

    // if (!myAppController.isInternetConnect) {
    //   myAppController.noInternetWaitingRequests.add(<String, dynamic>{
    //     keyRequestFunction: requestFunction,
    //   });
    //   myAppController.update();
    //   dismissLoading();
    //   return;
    // }

    try {
      if (withLoading) {
        startLoading();
      }
      // check method type
      switch (method) {
        case ApiMethods.get:
          response = await _dio().get(fullUrl ?? (AppUrl.baseUrl + path!));

          break;
        case ApiMethods.post:
          response = await _dio().post(
            fullUrl ?? (AppUrl.baseUrl + path!),
            data: body,
          );
          break;
        case ApiMethods.put:
          response = await _dio().put(
            fullUrl ?? (AppUrl.baseUrl + path!),
            data: body,
          );
          break;
        case ApiMethods.delete:
          response = await _dio().delete(
            fullUrl ?? (AppUrl.baseUrl + path!),
            data: body,
          );
          break;
        case ApiMethods.patch:
          response = await _dio().patch(
            fullUrl ?? (AppUrl.baseUrl + path!),
            data: body,
          );
          break;
      }

      // print response data in console
      showRequestDetails(
        method: method.toString(),
        path: path,
        fullUrl: fullUrl,
        formatResponse: formatResponse,
        className: className,
        body: body.toString(),
        headers: _dio().options.headers,
        queryParameters: _dio().options.queryParameters.toString(),
        response: response.data,
        time: stopwatch.elapsedMilliseconds,
      );
      stopwatch.stop();

      if (withLoading) {
        dismissLoading();
      }
      if (onSuccess != null) {
        await onSuccess((response?.data?['data'] ?? response?.data ?? response),
            response.data);
      }
    } on Exception catch (error) {
      dismissLoading();
      if (error is DioException) {
        final dynamic errorData = error.response?.data ??
            <String, dynamic>{
              'errors': <Map<String, String>>[
                <String, String>{'message': 'Un handled Error'}
              ]
            };
        // print response error
        showRequestDetails(
          method: method.toString(),
          path: path,
          fullUrl: fullUrl,
          formatResponse: formatResponse,
          className: className,
          body: body.toString(),
          headers: _dio().options.headers,
          queryParameters: _dio().options.queryParameters.toString(),
          response: errorData,
          time: stopwatch.elapsedMilliseconds,
          isError: true,
        );

        //handle DioError here by error type or by error code
        if (shouldShowMessage) {
          showMessage(
            description:
                errorData['errors'] != null && errorData['errors'].length > 0
                    ? errorData['errors'][0]['message']
                    : errorData['message'],
            textColor: AppColor.redColor,
          );
        }

        if (onError != null) {
          await onError(errorData);
        }
        consoleLog(error);
        // if (error.response!.statusCode == 401 &&
        //     myAppController.userData != null) {
        //   myAppController.onSignOut();
        //   Get.offAllNamed(routeSendOtp);
        // }
      } else {
        // handle another errors
        showRequestDetails(
          method: method.toString(),
          path: path,
          fullUrl: fullUrl,
          formatResponse: formatResponse,
          className: className,
          body: body.toString(),
          headers: _dio().options.headers,
          queryParameters: _dio().options.queryParameters.toString(),
          response: error,
          time: stopwatch.elapsedMilliseconds,
          isError: true,
          otherCatch: true,
        );
      }
      stopwatch.stop();
    }
  }
}

void startLoading() {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(),
    ),
    barrierDismissible: false,
  );
}

void dismissLoading() {
  Get.back();
}

void showMessage({required String description, required Color textColor}) {
  Get.snackbar(
    'Message',
    description,
    backgroundColor: Colors.black,
    colorText: textColor,
  );
}

enum ApiMethods {
  post,
  get,
  put,
  delete,
  patch,
}
