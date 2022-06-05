import 'package:bookhubuz/base/base_controller.dart';
import 'package:bookhubuz/data/models/book_review.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BookReviewController extends GetxController {
  late final FirebaseFirestore firestore;
  final bookReviews = <BookReview>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    print("here we go again in book reveiews");
    super.onInit();
  }

  @override
  void onReady() async {
    isLoading.value = true;
    try {
      bookReviews.value = await fetchBookReviews();
    } catch (err) {
      showErrorSnackbar(
          "Error while fetching foods from server: " + err.toString());
      throw err;
    }
    isLoading.value = false;

    super.onReady();
  }

  Future<List<BookReview>> fetchBookReviews() async {
    final List<BookReview> books = [];
    await firestore
        .collection("bookReviews")
        .orderBy('postedTimestamp', descending: true)
        .get()
        .then((value) {
      //print(value.size);
      value.docs.forEach((element) {
        final book = BookReview.fromJson(element.data());
        book.id = element.id;
        //print(food.id);
        books.add(book);
      });
    });
    return books;
  }

  Future<void> incrementLike(String reviewId) async {
    firestore
        .collection("bookReviews")
        .doc(reviewId)
        .update({"likes": FieldValue.increment(1)});
  }
}
