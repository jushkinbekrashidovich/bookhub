import 'package:bookhubuz/controller/main/auth/fill_profile_controller.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/home/widgets/profile_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: CircleAvatar(
                        radius: 54, child: Image.asset('assets/user.jpg')),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FirebaseAuth.instance.currentUser!.displayName
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        FirebaseAuth.instance.currentUser!.phoneNumber
                            .toString(),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ))
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            //height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ProfileItems(
                  text: 'Edit Profile',
                  icon: Icon(CupertinoIcons.person),
                  link: () {
                    Get.toNamed(AppRoutes.editprofile);
                  },
                ),
                const Divider(),
                ProfileItems(
                  text: 'My Dashboard',
                  icon: const Icon(CupertinoIcons.square_list),
                  link: () {
                    Get.lazyPut(() => FillProfileController());
                    Get.toNamed(AppRoutes.username);
                  },
                ),
                const Divider(),
                ProfileItems(
                  text: 'Settings',
                  icon: const Icon(CupertinoIcons.settings),
                  link: () {
                    Get.toNamed(AppRoutes.settings);
                  },
                ),
                const Divider(),
                ProfileItems(
                  text: 'Rate ',
                  icon: const Icon(
                    CupertinoIcons.star,
                  ),
                  link: () {
                    Get.toNamed(AppRoutes.editprofile);
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
