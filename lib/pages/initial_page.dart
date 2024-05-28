import 'package:app/controllers/auth_controller.dart';
import 'package:app/services/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    /// Where to after opening the apps in fresh state mode
    /// if authenticated, has completed onboarding?
    Future<String> getNextPage() async {
      // Uncomment this to restore app back to initial/empty state
      // Shortcut: Logout
      // deleteAllKeyValueFromStorage();
      if (authController.checkAuthStatus()) {
        return RouteHelper.homeRoute;
      } else {
        return RouteHelper.authRoute;
      }
    }

    return FutureBuilder(
      // Based on this output
      future: getNextPage(),

      // What to do with the screen
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          debugPrint("$runtimeType ConnectionState.waiting");
          return loadingView();
        } else if (snapshot.hasError) {
          debugPrint("$runtimeType snapshot.hasError");
          return Text('Error: ${snapshot.error}');
        } else {
          final nextPage = snapshot.data;
          debugPrint("$runtimeType nextPage $nextPage");

          if (nextPage != null) {
            Future.delayed(const Duration(milliseconds: 1), () {
              debugPrint("Next Page ${nextPage.toString()}");
              Get.offNamed(nextPage.toString());
            });
          }

          debugPrint("$runtimeType Empty widget");

          // Return an empty widget
          return const SizedBox.shrink();
        }
      },
    );
  }

  Scaffold loadingView() {
    return const Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
