import 'package:app/controllers/auth_controller.dart';
import 'package:app/helpers/api_constant.dart';
import 'package:app/providers/base_provider.dart';
import 'package:app/providers/data/login.dart';
import 'package:app/providers/data/user.dart';
import 'package:app/services/constant_helper.dart';
import 'package:app/services/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends BaseProvider {
  /// Login
  Future<dynamic> login(
      {required String emailOrPhone, required String password}) async {
    final response = await post(ApiConstant.login,
        {"emailOrPhone": emailOrPhone, "password": password});

    if (response.isOk) {
      return Login.fromJson(response.body);
    } else {
      debugPrint(response.body);
      // return response.body;
    }
  }

  Future<dynamic> me() async {
    final response = await get(ApiConstant.me);

    if (response.isOk) {
      return User.fromJson(response.body);
    }
  }

  /// Things to do if contractor is unauthenticated
  void actionWhenUnauthenticated() {
    // Empty the token
    GetStorage().write(ConstantHelper.apiToken, null);
    Get.offAllNamed(RouteHelper.authRoute);
  }
}
