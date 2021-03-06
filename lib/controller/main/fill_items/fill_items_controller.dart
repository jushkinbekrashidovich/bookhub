import 'package:bookhubuz/base/base_controller.dart';
import 'package:bookhubuz/data/models/book_model.dart';
import 'package:bookhubuz/routes/app_pages.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class FillItemsController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final category = "educational".obs;
  XFile? image;
  final isExchange = false.obs;
  final didImageSelected = false.obs;

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

  Future<void> addBook() async {
    var imageUrl = "no";

    Book book = Book();
    book.title = titleController.text;
    book.description = descriptionController.text;
    book.postedTimestamp = DateTime.now().millisecondsSinceEpoch;
    book.price = isExchange.value ? 0 : double.parse(priceController.text);
    book.photoUrl = " ";
    book.category = category.value;
    book.isExchange = isExchange.value;

    if (image != null) {
      //print(image.path);
      // print("Uploading image");
      // firebase_storage.UploadTask uploadTask;
      //
      // firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      //     .ref()
      //     .child('postImages')
      //     .child('/${Uuid().v4()}.jpg');
      //
      // final metadata = firebase_storage.SettableMetadata(
      //     contentType: 'image/jpeg',
      //     customMetadata: {'picked-file-path': image!.path});
      //
      // uploadTask = ref.putFile(File(image!.path), metadata);
      // await Future.value(uploadTask);

      firebase_storage.FirebaseStorage storage =
          await firebase_storage.FirebaseStorage.instance;
      print("Instance got");
      int ced = await image!.length();
      await firebase_storage.FirebaseStorage.instance
          .ref('postImages/${Uuid().v4()}.jpg')
          .putFile(File(image!.path))
          .then((p0) async {
        imageUrl = await p0.ref.getDownloadURL();
      }).catchError((onError) {
        //Get.back();
        //showErrorSnackbar(onError.toString());
      });
      print("Image url: " + imageUrl);
      // StorageTaskSnapshot snapshot = await storage
      //     .ref()
      //     .child("admins/$adminId.png")
      //     .putFile(uiData.profileImage)
      //     .onComplete;
      // print("2");
    }

    final currUser = FirebaseAuth.instance.currentUser!;
    book.userId = currUser.uid;
    book.phoneNumber = currUser.phoneNumber;
    book.ownerName = currUser.displayName;
    book.location = "Tashkent";
    book.photoUrl = imageUrl == "" ? null : imageUrl;

    FirebaseFirestore.instance
        .collection("books")
        .add(book.toJson())
        .then((value) {
      Get.offAllNamed(AppRoutes.main);
      showSuccessSnackbar("Book added");
    }).catchError((err) {
      // Get.back();
      showErrorSnackbar(err.toString());
    });
  }

  Future<void> pickImage() async {
    print("Picking image");
    await ImagePicker()
        .pickImage(imageQuality: 50, source: ImageSource.gallery)
        .then((value) => {
              if (value != null)
                {
                  image = value,
                  print("image picked"),
                  didImageSelected.value = true
                }
            })
        .catchError((onError) {
      Get.snackbar("Error", onError.toString());
    });
    print("image picking finished");
  }
}
