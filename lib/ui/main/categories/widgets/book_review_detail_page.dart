import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookReviewDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String ownerName;
  final int likes;

  const BookReviewDetailPage({
    required this.title,
    required this.description,
    required this.date,
    required this.ownerName,
    required this.likes,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back)),
                Container(
                  margin: EdgeInsets.only(left: 65),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 10,),
                  Container(
                      margin: const EdgeInsets.only(right: 8, top: 4),
                      child:  CircleAvatar(
                        radius: 17,
                            child: Image.asset('assets/user.jpg'),
                      )),
                  Container(
                    width: 160,
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      ownerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 19),
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        date,
                        style: TextStyle(fontSize: 11),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              description,
              style: TextStyle(height: 1.8),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                right: 10,
              ),
              height: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    likes.toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
