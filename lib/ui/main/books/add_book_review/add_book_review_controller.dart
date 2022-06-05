import 'package:bookhubuz/data/models/book_review.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddBookReviewController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  Future<void> upload() async {
    BookReview bookReview = BookReview();

    final currUser = FirebaseAuth.instance.currentUser!;

    bookReview.title = title.text;
    bookReview.description = description.text;
    bookReview.ownerName = currUser.displayName;
    bookReview.postedTimestamp = DateTime.now().millisecondsSinceEpoch;
    bookReview.userId = currUser.uid;

    FirebaseFirestore.instance
        .collection("bookReviews")
        .add(bookReview.toJson())
        .then((value) {
      Get.back();
      // showSuccessSnackbar("Book added");
    }).catchError((err) {
      // Get.back();
      showErrorSnackbar(err.toString());
    });
  }
}
