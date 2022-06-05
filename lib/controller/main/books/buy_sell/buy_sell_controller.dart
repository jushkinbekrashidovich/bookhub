import 'package:bookhubuz/base/base_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/data/models/book_model.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuySellController extends GetxController {
  late FirebaseFirestore firestore;
  final books = <Book>[].obs;
  final isLoading = true.obs;
  final segmentedControlGroupValue = 0.obs;

  final RangeValues currentRangeValues = const RangeValues(20, 60);

  void setRange() {
    currentRangeValues;
    update(); // look here!
  }

  @override
  void onInit() async {
    firestore = FirebaseFirestore.instance;

    print("here we go again in buy sell controller");
    super.onInit();
  }

  @override
  void onReady() async {
    isLoading.value = true;
    try {
      await setBooksWithoutLoader();
    } catch (err) {
      showErrorSnackbar(
          "Error while fetching foods from server: " + err.toString());
      throw err;
    }
    isLoading.value = false;

    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> setBooksWithoutLoader() async {
    books.value = await fetchBooks();
  }

  Future<List<Book>> fetchBooks() async {
    final List<Book> books = [];
    await firestore
        .collection("books")
        .where('isExchange', isEqualTo: false)
        .orderBy('postedTimestamp', descending: true)
        .get()
        .then((value) {
      //print(value.size);
      value.docs.forEach((element) {
        final book = Book.fromJson(element.data());
        book.id = element.id;
        //print(food.id);
        books.add(book);
      });
    });
    return books;
  }

  // Future<void> fetchByCategory(String catName) async {
  //   foods.clear();
  //   isLoading.value = true;
  //   try {
  //     foods.value = await fetchCategory(catName);
  //   } catch (err) {}
  //   isLoading.value = false;
  // }

  // Future<List<Food>> fetchCategory(String catName) async {
  //   if (catName == 'all') {
  //     return await fetchFoods();
  //   } else {
  //     final List<Food> foods = [];
  //     await firestore
  //         .collection("posts")
  //         .where('category', isEqualTo: catName)
  //         .orderBy('postedTimestamp', descending: true)
  //         .get()
  //         .then((value) {
  //       //print(value.size);
  //       value.docs.forEach((element) {
  //         final food = Food.fromJson(element.data());
  //         food.id = element.id;
  //         //print(food.id);
  //         foods.add(food);
  //       });
  //     });

  //     return foods;
  //   }
  // }
// Rx color = AppColors.mainColor.obs;

// void setColor1(changeColor){
//     changeColor = color;
//     update();
// }

// void setColor2(changeColor){
//     changeColor = color;
//     update();

// }
//Color get color => _color;
  Future<List<Book>> fetchExchangeMarket() async {
    final List<Book> books = [];
    await firestore
        .collection("books")
        .where('isExchange', isEqualTo: true)
        .orderBy('postedTimestamp', descending: true)
        .get()
        .then((value) {
      //print(value.size);
      value.docs.forEach((element) {
        final book = Book.fromJson(element.data());
        book.id = element.id;
        //print(food.id);
        books.add(book);
      });
    });
    return books;
  }

  // Rx color get color => _color;
  Future<void> switchMarket() async {
    books.clear();
    isLoading.value = true;
    try {
      if (segmentedControlGroupValue.value == 0) {
        books.value = await fetchBooks();
      } else if (segmentedControlGroupValue.value == 1) {
        books.value = await fetchExchangeMarket();
      }
    } catch (err) {}

    isLoading.value = false;
  }
}
