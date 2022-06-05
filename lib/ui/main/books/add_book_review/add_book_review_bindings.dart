import 'package:bookhubuz/ui/main/books/add_book_review/add_book_review_controller.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/home/detail_controller.dart';

class AddBookReviewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBookReviewController());
  }
}
