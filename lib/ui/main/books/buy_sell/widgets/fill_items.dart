import 'package:bookhubuz/controller/main/fill_items/fill_items_controller.dart';
import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FillItemsPage extends GetView<FillItemsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Add your book'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Upload image of your book'),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Photo",
                            //controller.longitude.value.toString(),
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffE6F2FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.photo_camera,
                                  color: !controller.didImageSelected.value
                                      ? AppColors.mainColor
                                      : Colors.green,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  !controller.didImageSelected.value
                                      ? "Select image"
                                      : "Image selected",
                                  style: TextStyle(
                                    color: !controller.didImageSelected.value
                                        ? AppColors.mainColor
                                        : Colors.green,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                          controller: controller.titleController,
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
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextFormField(
                          controller: controller.descriptionController,
                          maxLines: 3,
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Categories'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        // margin:
                        // EdgeInsets.symmetric(horizontal: DEFAULT_PADDING * 1.0),
                        //height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: black4,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(),
                          value: controller.category.value,
                          selectedItemBuilder: (_) {
                            return [
                              "educational",
                              "self-improvement",
                              'textbook',
                              'language',
                              'fiction',
                              'novel'
                            ].map((String choice) {
                              return Center(
                                child: Container(
                                  width: double.infinity,
                                  child: Text(choice),
                                ),
                              );
                            }).toList();
                          },
                          items: [
                            "educational",
                            "self-improvement",
                            'textbook',
                            'language',
                            'fiction',
                            'novel'
                          ].map((String choice) {
                            return DropdownMenuItem<String>(
                              value: choice,
                              child: Row(
                                children: [Text(choice)],
                              ),
                            );
                          }).toList(),
                          onChanged: (opt) {
                            controller.category.value = opt ?? 'all';
                            // controller.category.value = opt ?? 'all';
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        // margin:
                        // EdgeInsets.symmetric(horizontal: DEFAULT_PADDING * 1.0),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: black4,
                          borderRadius: BorderRadius.circular(12 * 1.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Is exchange?",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Spacer(),
                            Container(
                              //padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              height: double.infinity,
                              //width: 150,
                              child: CupertinoSwitch(
                                onChanged: (value) {
                                  controller.isExchange.value = value;
                                },
                                value: controller.isExchange.value,
                                activeColor: yellow1,
                                //activeTrackColor: Colors.yellow,
                                //inactiveThumbColor: Colors.redAccent,
                                //inactiveTrackColor: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: !controller.isExchange.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Price'),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextField(
                                controller: controller.priceController,
                                keyboardType: TextInputType.number,
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                width: MediaQuery.of(context).size.width * 0.9,
                onTap: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });

                  controller.addBook().then((value) {}).catchError((onError) {
                    Get.back();
                    showErrorSnackbar(onError.toString());
                  });
                  //Get.toNamed(AppRoutes.main);
                },
                child: const Text(
                  'Enter',
                  style: TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
