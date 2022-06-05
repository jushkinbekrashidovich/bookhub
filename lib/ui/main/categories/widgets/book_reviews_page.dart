import 'package:bookhubuz/controller/main/categories/book_review_controller.dart';
import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/books/add_book_review/add_book_review_bindings.dart';
import 'package:bookhubuz/ui/main/categories/widgets/book_review_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookReviewsPage extends GetView<BookReviewController> {
  const BookReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.mainColor,
        child: IconButton(
          icon: Icon(Icons.add_rounded,
          color: Colors.white,
          size: 30.sp,),
          onPressed: (){
            Get.toNamed(AppRoutes.addBookReview);

          },
        ),
      ),
      appBar: AppBar(
        title: const Text('Book Reviews'),
        actions: [
          IconButton(
              onPressed: () {
                AddBookReviewBindings().dependencies();
                Get.toNamed(AppRoutes.addBookReview);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Obx(
        () => ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12 * 1.0),
              child: Visibility(
                  visible: controller.isLoading.value,
                  child: Container(
                    //padding: EdgeInsets.all(50),
                    //width: 85.w,
                    child: Container(
                        padding: EdgeInsets.all(15),
                        //width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: black4,
                          borderRadius: BorderRadius.circular(12 * 1.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircularProgressIndicator(
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Loading",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  )),
            ),

            ...controller.bookReviews.value
                .map((element) => Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(width: 10,),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10, top: 4),
                                    child:  CircleAvatar(
                                      radius: 17,
                            child: Image.asset('assets/user.jpg'),
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    element.ownerName ?? "User",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),

                                Spacer(),
                                Container(
                                    child: Text(
                                  getReadableTime(element.postedTimestamp),
                                  style: TextStyle(fontSize: 11),
                                )),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: Text(
                              element.title ?? "no title",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(element.description ?? "No description",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff999999))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            height: 17,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  element.likes.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            height: 35,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BookReviewDetailPage(
                                        title: element.title ?? "no title",
                                        description: element.description ??
                                            "no description",
                                        date: getReadableTime(
                                            element.postedTimestamp),
                                        likes: element.likes ?? 0,
                                        ownerName: element.ownerName ?? "User",
                                      )));
                            },
                            child: const Text(
                              'Read more',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList()
            //
            /*ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) => Container(
                    height: 250,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(width: 10,),
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 4),
                                  child: const CircleAvatar(
                                    radius: 20,
                                  )),
                              Container(
                                width: 228,
                                margin: const EdgeInsets.only(right: 10),
                                child: const Text(
                                  'Jushkinbek ',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),

                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: const Text(
                                    '22/12/2022',
                                    style: TextStyle(fontSize: 11),
                                  ))
                            ],
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(left: 10, bottom: 10),
                          child: const Text(
                            'Atomic Habits',
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                              'The #1 New York Times bestseller. Over 4 million copies sold!Tiny Changes, Remarkable ResultsNo matter your goals, Atomic Habits offers a proven framework for improving--every day. ',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff999999))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 10,
                          ),
                          height: 17,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 15,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '999',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(height: 10,),
                        CustomButton(
                          height: 35,
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          onTap: () {
                            Get.toNamed(AppRoutes.bookreviewdetail);
                          },
                          child: const Text(
                            'Read more',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),*/
          ],
        ),
      ),
    );
  }

  static String getReadableTime(int? timestamp) {
    if (timestamp == null) return "null";
    final normalTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final today = DateTime.now();
    if (normalTime.day == today.day &&
        normalTime.month == today.month &&
        normalTime.year == today.year)
      return "Today at " +
          getNormalDayOrMonth(normalTime.hour) +
          ":" +
          getNormalDayOrMonth(normalTime.minute);
    //print("datetime: " + today.compareTo(normalTime).toString());
    if ((normalTime.millisecondsSinceEpoch - today.millisecondsSinceEpoch)
            .abs() <=
        86400000) return 'Yestarday';
    return getNormalDayOrMonth(normalTime.day) +
        '.' +
        getNormalDayOrMonth(normalTime.month);
  }

  static String getNormalDayOrMonth(int dayOrMonth) {
    return dayOrMonth.toString().length == 1
        ? '0' + dayOrMonth.toString()
        : dayOrMonth.toString();
  }
}
