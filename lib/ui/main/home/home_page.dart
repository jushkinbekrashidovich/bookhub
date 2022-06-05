import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/data/models/book_model.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/books/book_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/home/home_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final List _images = [
    'assets/books/item1.jpg',
    'assets/books/item2.jpg',
    'assets/books/item3.jpg',
    'assets/books/item4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: 5),
                  prefixIcon: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(child: Icon(Icons.search)),
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
                  hintText: 'search'),
            ),
            leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.profile);
              },
              icon: const Icon(
                CupertinoIcons.person_circle,
                size: 34,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //Get.toNamed(AppRoutes.bookdetail);
                  //FirebaseAuth.instance.signOut();
                  Get.toNamed(AppRoutes.notification);
                },
                icon: const Icon(Icons.notifications_none),
                iconSize: 27,
              ),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Latest Books',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.buysell);
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  // separatorBuilder: (context, index) => const SizedBox(
                  //   width: 10,
                  // ),

                  itemCount: controller.latest20Books.value.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      child: getHorizontalListBook(
                          controller.latest20Books.value[index], () {
                        // Get.toNamed(AppRoutes.bookdetail);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetailPage(
                                book: controller.latest20Books.value[index])));
                      }),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Exchange book',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.buysell);
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.latest20Books.value.length,
                physics: const NeverScrollableScrollPhysics(),
                //primary: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookDetailPage(
                              book: controller.latest20Books.value[index])));
                    },
                    child: getVerticalListItem(
                        controller.latest20Books.value[index]),
                  );
                },
              ),
            ],
          ),
        ));
  }

  Container getVerticalListItem(Book book) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 170,
      width: 360,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            // margin:
            //     EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            height: 170,
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(book.photoUrl ?? ""), fit: BoxFit.fill),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 3.0),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  book.title ?? "null",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  book.ownerName ?? "username",
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black87,
                      size: 15,
                    ),
                    Text(
                      book.location ?? "Tashkent",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    )
                  ],
                ),
                RatingBar.builder(
                  itemSize: 13,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bookmark,
                    size: 19,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    getReadableTime(book.postedTimestamp!),
                    maxLines: 1,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getHorizontalListBook(Book book, void Function() onTap) {
    // print(book.photoUrl);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: 115,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 165,
              width: 115,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(book.photoUrl.toString())),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Positioned(
                  //     right: 0,
                  //     child: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.arrow_circle_right_rounded,
                  //         color: AppColors.mainColor,
                  //         size: 30,
                  //       ),
                  //     )),
                  Positioned(
                    top: 3,
                    right: 3,
                    child: Container(
                        margin: EdgeInsets.all(3),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        // width: 20,
                        // height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.red.withOpacity(0.9)),
                        child: const Text(
                          "New",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    child: Container(
                        margin: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        // width: 20,
                        // height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.mainColor.withOpacity(0.9)),
                        child: Text(
                          book.isExchange!
                              ? "Exchange"
                              : book.price.toString() + " UZS",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                    bottom: 1,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? "null",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    // style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(
                  //   '14 000 uzs',
                  //   style: TextStyle(
                  //       color: Colors.blue, fontSize: 13),
                  // ),
                ],
              ),
            ),
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
