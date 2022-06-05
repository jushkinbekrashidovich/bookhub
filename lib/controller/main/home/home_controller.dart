import 'package:bookhubuz/data/models/book_model.dart';
import 'package:bookhubuz/widgets/custom_loader_dialog.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement FoodMarketController

  final segmentedControlGroupValue = 0.obs;
  late FirebaseFirestore firestore;
  final latest20Books = <Book>[].obs;
  final isLoading = true.obs;

  final count = 0.obs;

  @override
  void onInit() async {
    firestore = FirebaseFirestore.instance;

    print("here we go again");
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
  void increment() => count.value++;

  Future<void> setBooksWithoutLoader() async {
    latest20Books.value = await fetchBooks();
  }

  Future<List<Book>> fetchBooks() async {
    final List<Book> books = [];
    await firestore
        .collection("books")
        .orderBy('postedTimestamp', descending: true)
        .limit(20)
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
}
