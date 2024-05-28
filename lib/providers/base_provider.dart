import 'package:app/controllers/auth_controller.dart';
import 'package:app/helpers/api_constant.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

class BaseProvider extends GetConnect {
  final excludedPaths = [
    ApiConstant.login,
    // ApiConstant.register,
    // ApiConstant.forgotPassword
  ];

  @override
  Future<void> onInit() async {
    httpClient.baseUrl = "https://devoted-jennet-frankly.ngrok-free.app/api";

    httpClient.addRequestModifier((Request request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      /// Append API token if authenticated
      String? apiKey = GetStorage().read(AuthController.apiToken);
      if (apiKey != '') {
        request.headers['Authorization'] = 'Bearer $apiKey';
      }
      return request;
    });

    httpClient.addResponseModifier((Request request, Response response) {
      if (!excludedPaths.contains(request.url.path) &&
          response.statusCode == 401) {
        Get.find<AuthProvider>().actionWhenUnauthenticated();
        return false;
      }

      if (response.statusCode == 422) {
        debugPrint(response.bodyString);
      }
      return response;
    });
  }
}
