import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList(
      {Key? key, required this.image, required this.ontab, required this.title, this.size=13 })
      : super(key: key);

  final String image;
  final String title;
 final double size;
  final Function ontab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontab();
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0.0, 2.0),
              ),
              //
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
           const SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
