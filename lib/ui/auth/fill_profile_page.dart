import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main/auth/fill_profile_controller.dart';

class FillProfilePage extends GetView<FillProfileController> {
  const FillProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        // key: controller.registFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 35),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          onChanged: (text) {
                            controller.userName = text;
                          },
                          // controller: controller.userName,
                          // onSaved: (value) {
                          //   controller.usernameController =
                          //       value as TextEditingController;
                          // },
                          // validator: (value){
                          //   return controller.valida;
                          // },
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    Center(child: Icon(CupertinoIcons.person)),
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
                              hintText: 'full name'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        onChanged: (text) {
                          controller.userLocation = text;
                        },
                        // controller: controller.userageController,
                        // keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: SizedBox(
                              width: 20,
                              height: 20,
                              child:
                                  Center(child: Icon(CupertinoIcons.location)),
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
                            hintText: 'Location'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width * 0.9,
              onTap: () {
                controller.next();
              },
              child: const Text(
                'Enter',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
