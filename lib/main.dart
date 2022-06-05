import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:bookhubuz/bindings/splash_bindings.dart';
import 'package:bookhubuz/core/constants/constants.dart';
import 'package:bookhubuz/data/hive/hive_database.dart';
import 'package:bookhubuz/data/hive/products.dart';
import 'package:bookhubuz/data/source/local_source.dart';
import 'package:bookhubuz/routes/app_pages.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/translations/app_translations.dart';
import 'package:sizer/sizer.dart';

import 'core/theme/app_theme.dart';

// flutter pub run flutter_launcher_icons:main
// flutter run -d windows --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety
// flutter build apk --split-per-abi --no-sound-null-safety
// flutter build appbundle --release --no-sound-null-safety
// flutter pub run build_runner watch --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initial db
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductAdapter());
  // await HiveDatabase.getInstance();

  // /// local source
  // await LocalSource.getInstance();
  Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(const MyApp(currentLocale: "en"));
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  const MyApp({
    Key? key,
    required this.currentLocale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (ctx) {
            return Sizer(builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                title: "BookHub.uz",
                //navigatorKey: AppConstants.navigatorKey,
                theme: AppThemes.light,
                darkTheme: AppThemes.dark,

                debugShowCheckedModeBanner: false,

                /// binding
                initialBinding: SplashBindings(),

                /// route
                initialRoute: AppRoutes.initial,
                getPages: AppPages.pages,
                supportedLocales: const [
                  Locale("ru"),
                  Locale("uz"),
                  Locale("en"),
                ],

                ///  locale
                locale: Locale(currentLocale),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate
                ],
                translationsKeys: AppTranslations.translations,

                ///
                defaultTransition: Transition.fadeIn,

                ///
                transitionDuration: const Duration(milliseconds: 100),
              );
            });
          }),
    );
  }
}


 // theme: ThemeData(
                //   fontFamily: GoogleFonts.roboto().fontFamily,
                //   iconTheme: IconThemeData(color: Colors.black87, size: 20),
                //   textTheme: TextTheme(
                //       bodyText1: TextStyle(
                //           color: Colors.black87,
                //           // fontSize: 15.sp,
                //           // fontWeight: FontWeight.bold,
                //           fontFamily: GoogleFonts.roboto().fontFamily),
                //       bodyText2: TextStyle(
                //           //fontSize: 16.sp,
                //           // fontWeight: FontWeight.bold,
                //           color: Colors.black87,
                //           fontFamily: GoogleFonts.roboto().fontFamily)),
                //   primaryColor: Colors.grey,
                //   appBarTheme: AppBarTheme(
                //     centerTitle: true,
                //     titleTextStyle:
                //         TextStyle(color: Colors.black87, fontSize: 20),
                //     iconTheme: IconThemeData(color: Colors.black87, size: 20),
                //     systemOverlayStyle: SystemUiOverlayStyle(
                //       statusBarColor: Colors.white,
                //       systemNavigationBarColor: Colors.red,
                //       systemNavigationBarIconBrightness: Brightness.dark,
                //       systemNavigationBarDividerColor: Colors.red,
                //       statusBarIconBrightness: Brightness.dark,
                //       statusBarBrightness: Brightness.light,
                //     ),
                //     backgroundColor: Colors.white,
                //     elevation: 0.5,
                //     //centerTitle: true,
                //     // titleTextStyle: TextStyle(
                //     //     color: Colors.black87,
                //     //     fontSize: 18.sp,
                //     //     fontWeight: FontWeight.w600,
                //     //     fontFamily: GoogleFonts.comfortaa().fontFamily),
                //   ),
                // ),
                // darkTheme: ThemeData(
                //   fontFamily: GoogleFonts.roboto().fontFamily,
                //   // iconTheme: IconThemeData(color: Colors.black87, size: 20.sp),
                //   // textTheme: TextTheme(
                //   //     bodyText1: TextStyle(
                //   //         color: Colors.black87,
                //   //         fontSize: 15.sp,
                //   //         fontWeight: FontWeight.bold,
                //   //         fontFamily: GoogleFonts.comfortaa().fontFamily),
                //   //     bodyText2: TextStyle(
                //   //         fontSize: 16.sp,
                //   //         fontWeight: FontWeight.bold,
                //   //         color: Colors.black87,
                //   //         fontFamily: GoogleFonts.comfortaa().fontFamily)),
                //   // primaryColor: Colors.grey,
                //   appBarTheme: AppBarTheme(
                //     // iconTheme:
                //     //     IconThemeData(color: Colors.black87, size: 15.sp),
                //     systemOverlayStyle: SystemUiOverlayStyle(
                //       statusBarColor: Colors.white,
                //       systemNavigationBarColor: Colors.red,
                //       systemNavigationBarIconBrightness: Brightness.dark,
                //       systemNavigationBarDividerColor: Colors.red,
                //       statusBarIconBrightness: Brightness.dark,
                //       statusBarBrightness: Brightness.light,
                //     ),
                //     backgroundColor: Colors.white,
                //     elevation: 0.5,
                //     centerTitle: true,
                //     // titleTextStyle: TextStyle(
                //     //     color: Colors.black87,
                //     //     fontSize: 18.sp,
                //     //     fontWeight: FontWeight.w600,
                //     //     fontFamily: GoogleFonts.comfortaa().fontFamily),
                //   ),
                // ),