import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
