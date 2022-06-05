import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/splash/splash_controller.dart';
import 'package:bookhubuz/core/paints/icon_logo_painter.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (ctr) => const Scaffold(
        body: Center(
          child: Text(
            'bookhub',
            style: TextStyle(color: AppColors.mainColor, fontSize: 49),
          ),
        ),
      ),
    );
  }
}
