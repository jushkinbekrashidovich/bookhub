import 'package:bookhubuz/base/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    // FirebaseAuth.instance.signOut();
    super.onInit();
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () async {
        if (FirebaseAuth.instance.currentUser != null) {
          // signed in
          final firestore = FirebaseFirestore.instance;
          print(FirebaseAuth.instance.currentUser!.uid);
          final document = await firestore
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();

          if (document.data()!['full_name'] != null) {
            //account is in db, no need to create user
            print("3");
            Get.offAllNamed('/main');
          } else {
            //no account yet in db

            print("1");
            Get.toNamed(AppRoutes.username);
          }
        } else {
          Get.offAllNamed(AppRoutes.authentication);
        }
        //Get.offAllNamed('/main'); //TODO:

        //Get.offNamed(AppRoutes.main);
      },
    );
  }
}
