import 'package:bookhubuz/controller/main/auth/fill_profile_controller.dart';
import 'package:bookhubuz/controller/main/books/buy_sell/buy_sell_controller.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/home/home_controller.dart';
import 'package:bookhubuz/controller/main/main_controller.dart';

class UserNameBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FillProfileController());
  }
}
