import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final void Function() callback;
  ChoiceCard(
      {required this.text, required this.imageUrl, required this.callback});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 270,
        height: 204,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFd8dbe0),
                offset: Offset(0, 2),
                blurRadius: 30.0,
                spreadRadius: 10),
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Material(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: imageUrl,
                    child:Image.asset('assets/$imageUrl.png', height: 130, width: 180,),
                    
                  ),
                  Hero(
                      tag: imageUrl + "choice",
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ))
                ],
              ),
            ),
            onTap: callback,
            splashColor: AppColors.mainColor,
            highlightColor: Colors.transparent,
          ),
          color: Colors.transparent,
        ),
      ),
    );
  }
}