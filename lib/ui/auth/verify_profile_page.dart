import 'package:bookhubuz/controller/main/auth/verify_profile_page_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/home/widgets/profile_items.dart';
import 'package:bookhubuz/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

class VerifyProfilePage extends GetView<VerifyProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
          child: Column(children: [
            CustomTextField(
              textInputType: TextInputType.text,
              hint: "full_name".tr(),
              onChanged: (phoneNumber) {
                // controller.phoneNumber.value = phoneNumber;
              },
              defaultText: "",
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // /controller.authenticate();
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
                  borderRadius: BorderRadius.circular(24 * 1.0),
                ),
                //side: BorderSide(width: 1, color: Colors.green),
                primary: AppColors.mainColor, // <-- Button color
                onPrimary: Colors.white, // <-- Splash color
              ),
            ),
          ]),
        ));
  }
}
