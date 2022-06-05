import 'package:bookhubuz/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';

class FillProfileController extends BaseController {
  var userName = '';
  var userLocation = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }

  Future<void> next() async {
    if (userName.length == 0 || userLocation.length == 0) {
      Get.snackbar("Error", "Please fill both fields");
    } else {
      //TODO: SAVE to firestore
      FirebaseAuth.instance.currentUser!.updateDisplayName(userName);
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"full_name": userName, "location": userLocation});
      Get.offAllNamed(AppRoutes.main);
    }
  }
}
