import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/home/detail_controller.dart';
import 'package:bookhubuz/controller/splash/splash_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
