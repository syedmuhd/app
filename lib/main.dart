import 'package:app/pages/home_page.dart';
import 'package:app/pages/initial_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/services/app_theme.dart';
import 'package:app/services/init_service.dart';
import 'package:app/services/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark));

  await initializeServices();

  runApp(const App());
}

Future<void> initializeServices() async {
  debugPrint('starting services ...');

  /**
   * Dependencies in order
   */
  await Get.putAsync(() => InitService().init());

  debugPrint('All services started...');
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.lightTheme,
            themeMode: ThemeMode.system,
            initialRoute: RouteHelper.initialRoute,
            getPages: [
              // Initial Page
              GetPage(
                name: RouteHelper.initialRoute,
                page: () => const InitialPage(),
              ),

              // Login Page
              GetPage(
                name: RouteHelper.authRoute,
                page: () => const LoginPage(),
              ),

              // Home Page
              GetPage(
                name: RouteHelper.homeRoute,
                page: () => const HomePage(),
              )
            ],
          );
        });
  }
}
