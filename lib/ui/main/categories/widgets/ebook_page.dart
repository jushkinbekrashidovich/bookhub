import 'package:bookhubuz/ui/main/categories/widgets/categories_list.dart';
import 'package:flutter/material.dart';

class EbookPage extends StatelessWidget {
  const EbookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-books'),

      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GridView.count(
            padding: EdgeInsets.all(10),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children:  [
                 CategoriesList(
                image: 'assets/review.png',
                title: 'Science Fiction',
                ontab: () {},
                size: 19,
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'Self Improvement',
                ontab: () {},
                size: 19,
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'Textbooks',
                ontab: () {},
                size: 19,
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'IT',
                ontab: () {},
                size: 19,
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'Marketing',
                ontab: () {},
                size: 19,
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'Language',
                ontab: () {},
                size: 19,
              ),
              CategoriesList(
                image: 'assets/review.png',
                title: 'Uzbek',
                ontab: () {},
                size: 19,
              ),
              ],
              
            ),

        ],
      ),
    );
  }
}