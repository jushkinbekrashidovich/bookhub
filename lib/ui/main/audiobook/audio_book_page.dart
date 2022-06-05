import 'package:bookhubuz/controller/main/donation/donation_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AudioBookPage extends GetView<DonationController> {
  const AudioBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 16),
            child: Text('Audiobooks',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          ListView.separated(
            separatorBuilder: (context, index){
             return SizedBox(height: 10,);
            },
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  //Get.toNamed(AppRoutes.audiobookdetail);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(left: 5, right: 5),
                        height: 120,
                        width: 120,
                        
                        child: Image.asset('assets/books/item1.jpg'),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5, bottom: 5, right: 20),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('The Stand'),
                            Text('author', style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 10,),
                            RatingBar.builder(
                              itemSize: 13,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(height: 14,),
                            Container(
                              height: 20,
                              width: 73,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 221, 220, 220)
                              ),
                              child: Center(
                                child: Text('novel', style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 120, 119, 119)),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 201, 201, 201)
                          ),
                          child: Icon(Icons.play_arrow, size: 33, color: AppColors.mainColor,),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
