import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/data/login.dart';
import 'package:app/providers/data/user.dart';
import 'package:app/services/constant_helper.dart';
import 'package:app/services/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final isLogged = false.obs;

  final emailOrPhone = '0162731882'.obs;
  final password = 'password'.obs;
  final passwordConfirmation = ''.obs;
  final obscureText = true.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;

  final user = User().obs;

  @override
  void onInit() {
    hasError.value = false;
    super.onInit();
  }

  /// Login
  void login() {
    debugPrint("${emailOrPhone.value} ${password.value}");
    if (emailOrPhone.value != '' && password.value != '') {
      authProvider
          .login(emailOrPhone: emailOrPhone.value, password: password.value)
          .then((response) {
        if (response is Login) {
          saveToken(response.token).then(
            (result) {
              if (result) {
                Get.offAndToNamed(RouteHelper.homeRoute);
              }
            },
          );
        }
      });
    }
  }

  /// Logout
  Future<void> logout() async {
    removeToken().then(
      (value) {
        Get.offAndToNamed(RouteHelper.authRoute);
      },
    );
  }

  /// Me
  Future<void> me() async {
    authProvider.me().then((response) => user.value = response);
  }

  /// Save token
  Future<bool> saveToken(String? token) async {
    final storage = GetStorage();
    await storage.write(ConstantHelper.apiToken, token);
    return true;
  }

  /// Get token
  String? getToken() {
    final storage = GetStorage();
    debugPrint("Token ${storage.read(ConstantHelper.apiToken)}");
    return storage.read(ConstantHelper.apiToken);
  }

  /// Remove token
  Future<void> removeToken() async {
    final storage = GetStorage();
    await storage.remove(ConstantHelper.apiToken);
  }

  /// Check auth status
  bool checkAuthStatus() {
    final token = getToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
