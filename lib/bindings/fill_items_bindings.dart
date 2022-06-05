import 'package:bookhubuz/controller/main/fill_items/fill_items_controller.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/home/detail_controller.dart';
import 'package:bookhubuz/controller/splash/splash_controller.dart';

class FillItemsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FillItemsController>(
      () => FillItemsController(),
    );
  }
}
