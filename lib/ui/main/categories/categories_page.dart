import 'package:bookhubuz/controller/main/categories/book_review_controller.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/categories/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          GridView.count(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            children: [
              CategoriesList(
                image: 'assets/review.png',
                title: 'Book reviews',
                ontab: () {
                  Get.toNamed(AppRoutes.bookreviews);
                },
              ),
              CategoriesList(
                image: 'assets/ebook.png',
                title: 'e-Books',
                ontab: () {
                  Get.toNamed(AppRoutes.ebook);
                },
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'e-Books',
                ontab: () {
                  Get.toNamed(AppRoutes.audiobook);
                },
              ),
              CategoriesList(
                image: 'assets/todo.png',
                title: 'e-Books',
                ontab: () {},
              ),
              CategoriesList(
                image: 'assets/podcast.png',
                title: 'e-Books',
                ontab: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class ServicesList extends StatelessWidget {
//   ServicesList({
//     required this.title,
//     required this.image,
//     required this.ontab,
//   });

//   String title;
//   String image;
//   Function ontab;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ontab();
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//         elevation: 3,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(18),
//             color: Colors.white,
//             //
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(image),
//               SizedBox(
//                 height: 12,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 15),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }