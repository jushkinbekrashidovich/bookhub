import 'dart:ui';
import 'package:bookhubuz/controller/main/auth/auth_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/widgets/text_field.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart' hide Trans;

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0.4,
          backgroundColor: Colors.white,
          //automaticallyImplyLeading: false,
          title: Text("authentication".tr(),
              style: Theme.of(context).textTheme.bodyText1),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),

            // padding: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    textInputType: TextInputType.phone,
                    hint: "Phone number".tr(),
                    onChanged: (phoneNumber) {
                      controller.phoneNumber.value = phoneNumber;
                    },
                    defaultText: "+998",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.authenticate();
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        //width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "continue".tr(),
                          style: TextStyle(fontSize: 15.sp),
                        )),
                    style: ElevatedButton.styleFrom(
                      //padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //side: BorderSide(width: 1, color: Colors.green),
                      primary: AppColors.mainColor, // <-- Button color
                      onPrimary: Colors.white, // <-- Splash color
                    ),
                  ),
                ]),
          ),
        ));
  }
}
