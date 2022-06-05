import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AudioBookDetailPage extends StatelessWidget {
  const AudioBookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        child: Image.asset('assets/books/item3.jpg'),
                      ),
                      Column(
                        children: [
                          Text('Atomic Habits'),
                          Text('Author'),
                          RatingBar.builder(
                            itemSize: 15,
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
                          Row(
                            children: [
                              Text('Progress: '),
                              SizedBox(
                                width: 6,
                              ),
                              Text('85%'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Rating'),
                          Text('4.8'),
                        ],
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          Text('Users'),
                          Text('4.8'),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 201, 201, 201)),
                        child: Icon(
                          Icons.play_arrow,
                          size: 33,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Spacer(),
                TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.flight)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_car)),
                  ],
                ),
                TabBarView(
                  children: [
                    Icon(Icons.flight, size: 350),
                    Icon(Icons.directions_transit, size: 350),
                    Icon(Icons.directions_car, size: 350),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
