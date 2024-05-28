import 'package:app/controllers/auth_controller.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitService extends GetxService {
  Future<InitService> init() async {
    await GetStorage.init();

    /**
   * Providers
   */
    Get.put(AuthProvider(), permanent: true); // AuthProvider MUST use Get.put

    /**
   * Controllers
   */
    Get.lazyPut(() => AuthController(authProvider: Get.find<AuthProvider>()),
        fenix: true);

    return this;
  }
}
