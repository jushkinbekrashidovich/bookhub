import 'package:bookhubuz/controller/main/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthenticationController());
  }
}
