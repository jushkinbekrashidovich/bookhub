import 'package:bookhubuz/controller/main/books/books_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/books/widgets/choice_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BooksPage extends GetView<BooksController> {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChoiceCard(text: 'Sell & Buy book', imageUrl: 'buy', callback: (){
                Get.toNamed(AppRoutes.buysell);
              }),
              
              
             const Divider(),
              
              ChoiceCard(text: 'Exchange book', imageUrl: 'exchange', callback: (){
                Get.toNamed(AppRoutes.exchange);
              }),
            ],
        ),
      ),
    );
  }
}


