import 'package:app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: SizedBox(
            height: double.maxFinite.h,
            child: ListView(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "Bantuan",
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "App",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sila masukkan nombor phone atau email yang berdaftar.",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextField(
                  onChanged: (value) =>
                      authController.emailOrPhone.value = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email or Phone',
                  ),
                ),
                SizedBox(height: 20.h),
                TextField(
                  onChanged: (value) => authController.password.value = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () => authController.login(),
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
