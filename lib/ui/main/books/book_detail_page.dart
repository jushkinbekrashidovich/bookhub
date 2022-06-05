import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhubuz/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
  BookDetailPage({required this.book}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  height: 40,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert_outlined),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 350,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 230,
                        width: 160,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: NetworkImage(book.photoUrl ?? ""),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                        //margin: EdgeInsets.only(left: 20, right: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        book.title ?? "null",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        book.isExchange!
                            ? "For Exchange"
                            : book.price.toString() + " UZS",
                        style: TextStyle(color: Colors.lightBlue, fontSize: 22),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RatingBar.builder(
                        itemSize: 15,
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
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              //margin: EdgeInsets.only(left: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 17,
                            child: Image.asset('assets/user.jpg'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            book.ownerName ?? "User",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 17),
                        )),
                    Container(
                      height: 90,
                      margin:
                          EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                      child: Text(
                        book.description ?? "No description",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            top: 5,
                          ),
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 218, 218, 218),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            book.category ?? "No category",
                            style: TextStyle(fontSize: 13),
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on,
                              ),
                              Text(book.location ?? 'Tashkent'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: CustomButton(
                              margin: EdgeInsets.only(left: 10, right: 5),
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.telegram,
                                    color: Colors.white,
                                    size: 33,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Message',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              margin: EdgeInsets.only(right: 10, left: 5),
                              onTap: () {
                                // print(book.phoneNumber.toString());
                                launch(
                                    'tel://${book.phoneNumber!.replaceFirst("+", "")}');
                              },
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 33,
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text(
                                    'Call',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
