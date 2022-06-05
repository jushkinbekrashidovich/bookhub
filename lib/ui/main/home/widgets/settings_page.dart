import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/main/home/widgets/profile_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        //padding: EdgeInsets.only(left: 20, right: 10, top: 40, bottom: 20),
        height: 150,
        margin:const EdgeInsets.only(left: 15, right: 15, top: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileItems(
                text: 'Language', icon: Icon(Icons.language), link: () {}),
            const Divider(
              color: Color.fromARGB(255, 80, 78, 78),
            ),
            ProfileItems(
                text: 'Log out',
                icon: const Icon(
                  Icons.logout,
                ),
                link: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("Log out"),
                          content: const Text("Are you sure you want to log out?"),
                          actions: [
                            CupertinoDialogAction(
                                child: const Text("NO"),
                                onPressed: () {
                                  Get.back();
                                }),
                            CupertinoDialogAction(
                                child: const Text("YES"),
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Get.offAllNamed(AppRoutes.initial);
                                }),
                          ],
                        );
                      });
                  // Get.defaultDialog(
                  //   title: 'Are you sure to log out?',
                  //   middleText: 'If you log out now, you will have to log in again! ',
                  //  radius: 14,
                  // //  textCancel: 'Cancel',
                  // //  textConfirm: 'Yes',
                  //  onCancel: (){
                  //  },
                  //  onConfirm: (){

                  //  },
                  //  cancel: Text('cancel', style: TextStyle(color: Colors.black),),
                  //  confirm: Text('cancel', style: TextStyle(color: Colors.black),)

                  // );
                }),
          ],
        ),
      ),
    );
  }
}
