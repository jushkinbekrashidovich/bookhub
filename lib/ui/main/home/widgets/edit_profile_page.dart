import 'package:bookhubuz/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                     CircleAvatar(
                      radius: 53,
                            child: Image.asset('assets/user.jpg'),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6F2FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.photo_camera,
                            color: AppColors.mainColor,
                            size: 16,
                          ),
                          SizedBox(width: 4,),
                          Text(
                            'upload image',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: const Text(
                          'Full Name',
                          style: TextStyle(fontSize: 14),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child:  TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          // prefixIcon: SizedBox(
                          //   width: 20,
                          //   height: 20,
                          //   child: Center(child: Icon(Icons.search)),
                          // ),
                          filled: true,
                          fillColor: black4,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            gapPadding: 0,
                            borderSide: BorderSide.none,
                          ),
                          hintText:  FirebaseAuth.instance.currentUser!.displayName
                              .toString(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: const Text(
                          'Age',
                          style: TextStyle(fontSize: 14),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            top: 10,
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
                        ),
                      ),
                    ),
                    
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: const Text(
                          'Address',
                          style: TextStyle(fontSize: 14),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            top: 10,
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
                         // hintText: FirebaseAuth.instance.currentUser!.displayName
                              //.toString(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width * 0.9,
              onTap: () {
                //Get.toNamed(AppRoutes.main);
              },
              child: const Text(
                'Enter',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
