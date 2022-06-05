import 'package:bookhubuz/controller/main/books/buy_sell/buy_sell_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/data/models/book_model.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/books/book_detail_page.dart';
import 'package:bookhubuz/ui/main/books/buy_sell/widgets/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BuySellPage extends GetView<BuySellController> {
  BuySellPage({Key? key}) : super(key: key);
  final List _images = [
    'assets/books/item1.jpg',
    'assets/books/item2.jpg',
    'assets/books/item3.jpg',
    'assets/books/item4.jpg',
  ];
  // String dropdownValue = 'item1 ';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: const TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(child: Icon(Icons.search)),
                ),
                filled: true,
                fillColor: Color(0xffF9F9FD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  gapPadding: 0,
                  borderSide: BorderSide.none,
                ),
                hintText: 'search'),
          ),
          actions: [
            // Image.asset('assets/add_book1.png',),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addbook);
              },
              icon: const Icon(Icons.add),
            ),
            FilterBottomSheet(),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5 * 1.0),
              child: CupertinoSlidingSegmentedControl(
                  backgroundColor: Colors.black12.withOpacity(0.03),
                  padding: EdgeInsets.all(5),
                  //overlayColor: MaterialStateProperty.all(Colors.green),
                  thumbColor: AppColors.mainColor.withOpacity(0.8),
                  groupValue: controller.segmentedControlGroupValue.value,
                  children: <int, Widget>{
                    0: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Sales market",
                          style: TextStyle(
                              color:
                                  controller.segmentedControlGroupValue.value ==
                                          0
                                      ? Colors.white
                                      : Colors.black45),
                        )),
                    1: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Exchange market",
                          style: TextStyle(
                              color:
                                  controller.segmentedControlGroupValue.value ==
                                          1
                                      ? Colors.white
                                      : Colors.black54),
                        ))
                  },
                  onValueChanged: (i) {
                    controller.segmentedControlGroupValue.value =
                        int.parse(i.toString());
                    controller.switchMarket();
                    // setState(() {
                    //   segmentedControlGroupValue = i;
                  }),
            ),
            SizedBox(
              height: 20,
            ),
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
                                color: yellow1,
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
            Visibility(
                visible: !controller.isLoading.value &&
                    controller.books.value.length == 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "No books found",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            Expanded(
              child: ListView.builder(
                // separatorBuilder: (context, index) => const SizedBox(
                //   height: 10,
                // ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.books.value.length,
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                //primary: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetailPage(
                                book: controller.books.value[index])));
                      },
                      child:
                          getVerticalListItem(controller.books.value[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
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
