import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/widgets/custom_loader_dialog.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController

  final phoneNumber = "".obs;
  final verificationCode = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> authenticate() async {
    if (phoneNumber.value == "") {
      showErrorSnackbar("Telefon nomerini yozing");
      return;
    }
    if (!phoneNumber.value.contains("+")) {
      showErrorSnackbar("Telefon nomeri plus bilan boshlanishi kerak");
      return;
    }
    final firestore = FirebaseFirestore.instance;

    final auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      // signed in
      authCompleted();
    } else {
      print("Not signed in yet");
    }
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return CustomLoaderDialog();
        // return CustomComfirmationDialog(
        //   onCancel: () {},
        //   onConfirm: () {},
        //   text: "test",
        // );
      },
    );
    await auth.verifyPhoneNumber(
      timeout: Duration(seconds: 90),
      phoneNumber: phoneNumber.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("verification completed");

        //print("Metadata: " + auth.currentUser!.metadata.creationTime!.millisecondsSinceEpoch.toString());

        Get.snackbar(
          "info",
          "Mufavvaqiyatli",
          colorText: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
          progressIndicatorBackgroundColor: Colors.green,
          barBlur: 0,
          dismissDirection: DismissDirection.horizontal,
          duration: Duration(milliseconds: 2500),

          //instantInit: true,
          //shouldIconPulse: true,
          animationDuration: Duration(milliseconds: 300),
          icon: Icon(
            Icons.done,
            color: Colors.green,
            size: 35,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.mainColor,
        );
        await auth.signInWithCredential(credential);
        if ((auth.currentUser!.metadata.creationTime!.millisecondsSinceEpoch -
                    DateTime.now().millisecondsSinceEpoch)
                .abs() <
            300000) {
          FirebaseFirestore.instance
              .collection("app")
              .doc("statistics")
              .update({"totalUsers": FieldValue.increment(1)});
        }

        authCompleted();
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.back();

        showErrorSnackbar("Vefification failed" + " : " + e.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.back();

        showModalBottomSheet(
            isDismissible: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            context: Get.context!,
            builder: (builder) {
              return Container(
                height: MediaQuery.of(Get.context!).size.height * 0.8,
                color: Colors
                    .transparent, //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Kodni kiriting",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          //Type TextField
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(24 * 1.0),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            //maxLength: 6,
                            //autofocus: true,
                            onChanged: (text) {
                              verificationCode.value = text;
                            },
                            decoration: const InputDecoration(
                              hintText: "Kodni verifikatsiya qiling",
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // Create a PhoneAuthCredential with the code
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: verificationCode.value);

                            // Sign the user in (or link) with the credential
                            try {
                              await auth.signInWithCredential(credential);
                            } catch (err) {
                              showErrorSnackbar(err.toString(), timeout: 4500);
                              return;
                            }

                            if (auth.currentUser != null) {
                              // signed in
                              authCompleted();

                              print("Signed in");
                            } else {
                              showErrorSnackbar("Kutilmagan error");
                            }

                            //controller.authenticate();
                            //Get.find()
                          },
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              //width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                "tasdiqlash",
                                style: TextStyle(fontSize: 15),
                              )),
                          style: ElevatedButton.styleFrom(
                            //padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24 * 1.0),
                            ),
                            //side: BorderSide(width: 1, color: Colors.green),
                            primary: AppColors.mainColor, // <-- Button color
                            onPrimary: Colors.white, // <-- Splash color
                          ),
                        ),
                      ],
                    )),
              );
            });
        Get.snackbar(
          "info",
          "Kod muvaffaqiyatli jo'natildi",
          colorText: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
          progressIndicatorBackgroundColor: Colors.green,
          barBlur: 0,
          dismissDirection: DismissDirection.horizontal,
          duration: Duration(milliseconds: 2500),

          //instantInit: true,
          //shouldIconPulse: true,
          animationDuration: Duration(milliseconds: 300),
          icon: const Icon(
            Icons.done,
            color: Colors.green,
            size: 35,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.mainColor,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //Get.snackbar("info".tr(), "otp_timed_out".tr());
      },
    );
  }

  Future<void> authCompleted() async {
    final firestore = FirebaseFirestore.instance;

    final document = await firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (document.data() != null) {
      if (document.data()!['full_name'] != "") {
        //account is in db, no need to create user
        print("3");
        Get.offAllNamed('/main');
      } else {
        //no account yet in db
        createUserDb();
        print("1");
        Get.toNamed(AppRoutes.username);
      }
    } else {
      //no account yet in db
      print("2");
      await createUserDb();
      Get.toNamed(AppRoutes.username);
    }
  }

  Future<void> createUserDb() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"phoneNumber": phoneNumber.value});
  }
}
