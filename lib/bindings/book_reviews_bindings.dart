import 'package:bookhubuz/controller/main/books/buy_sell/buy_sell_controller.dart';
import 'package:bookhubuz/controller/main/categories/book_review_controller.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/home/detail_controller.dart';
import 'package:bookhubuz/controller/splash/splash_controller.dart';

class BookReviewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookReviewController());
  }
}
