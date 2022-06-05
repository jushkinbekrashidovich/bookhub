// import 'package:hive/hive.dart';
// import 'package:bookhubuz/core/constants/app_keys.dart';

// import 'products.dart';

// class HiveDatabase {
//   static Box<Products>? _boxFavourite;
//   static HiveDatabase instance = HiveDatabase._();

//   HiveDatabase._();

//   static Future<HiveDatabase> getInstance() async {
//     _boxFavourite ??= await Hive.openBox<Products>(AppKeys.db);
//     return instance;
//   }

//   List<Products> products() {
//     return (_boxFavourite?.values ?? []).toList();
//   }

//   Future<void> addProduct(Products product) async {
//     await _boxFavourite?.put(product.id, product);
//   }

//   Future<void> updateProduct(Products product, bool isMinus) async {
//     if (isMinus) {
//       await _boxFavourite?.put(
//         product.id,
//         Products(
//           id: product.id,
//           price: product.price,
//           quantity: (product.quantity ?? 0) - 1,
//           name: product.name,
//           image: product.image,
//         ),
//       );
//     } else {
//       await _boxFavourite?.put(
//         product.id,
//         Products(
//           id: product.id,
//           price: product.price,
//           quantity: (product.quantity ?? 0) + 1,
//           name: product.name,
//           image: product.image,
//         ),
//       );
//     }
//   }

//   Future<void> deleteProduct(String id) async {
//     await _boxFavourite?.delete(id);
//   }

//   Future<void> clearProduct() async {
//     await _boxFavourite?.clear();
//   }
// }
