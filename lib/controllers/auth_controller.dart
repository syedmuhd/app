import 'package:app/providers/auth_provider.dart';
import 'package:app/providers/data/login.dart';
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

  static const apiToken = "apiToken";

  Login? get data => Login();

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
                Get.toNamed(RouteHelper.homeRoute);
              }
            },
          );
        }
      });
    }
  }

  Future<bool> saveToken(String? token) async {
    final storage = GetStorage();
    await storage.write(AuthController.apiToken.toString(), token);
    return true;
  }

  String? getToken() {
    final storage = GetStorage();
    debugPrint("Token ${storage.read(AuthController.apiToken.toString())}");
    return storage.read(AuthController.apiToken.toString());
  }

  Future<void> removeToken() async {
    final storage = GetStorage();
    await storage.remove(AuthController.apiToken.toString());
  }

  bool checkAuthStatus() {
    final token = getToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
