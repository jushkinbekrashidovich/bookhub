import 'package:bookhubuz/controller/main/fill_items/fill_items_controller.dart';
import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/books/add_book_review/add_book_review_controller.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddBookReviewPage extends GetView<AddBookReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your book'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Title'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: controller.title,
                          // controller: controller.titleController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            // prefixIcon: SizedBox(
                            //   width: 20,
                            //   height: 20,
                            //   child: Center(child: Icon(Icons.search)),
                            // ),
                            filled: true,
                            fillColor: black4,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              gapPadding: 0,
                              borderSide: BorderSide.none,
                            ),
                            // hintText: 'search'
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text('Description'),
                     const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextFormField(
                          controller: controller.description,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            filled: true,
                            fillColor: black4,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              gapPadding: 0,
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      CustomButton(
                          onTap: () {
                            controller.upload();
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          )),
                          SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
