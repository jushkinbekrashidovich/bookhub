import 'package:bookhubuz/bindings/book_reviews_bindings.dart';
import 'package:bookhubuz/bindings/buy_sell_bindings.dart';
import 'package:bookhubuz/bindings/fill_items_bindings.dart';
import 'package:bookhubuz/bindings/username_bindings.dart';
import 'package:bookhubuz/ui/auth/auth_page.dart';
import 'package:bookhubuz/ui/auth/verify_profile_page.dart';
import 'package:bookhubuz/ui/auth/fill_profile_page.dart';
import 'package:bookhubuz/ui/main/audiobook/audio_book_detail_page.dart';
import 'package:bookhubuz/ui/main/books/add_book_review/add_book_review_bindings.dart';
import 'package:bookhubuz/ui/main/books/add_book_review/add_book_review_page.dart';
import 'package:bookhubuz/ui/main/books/book_detail_page.dart';
import 'package:bookhubuz/ui/main/books/buy_sell/widgets/add_book_page.dart';
import 'package:bookhubuz/ui/main/books/buy_sell/buy_sell_page.dart';
import 'package:bookhubuz/ui/main/books/buy_sell/widgets/fill_items.dart';
import 'package:bookhubuz/ui/main/books/exchange/exchange_page.dart';
import 'package:bookhubuz/ui/main/categories/widgets/add_book_review.dart';
import 'package:bookhubuz/ui/main/categories/widgets/audio_book_page.dart';
import 'package:bookhubuz/ui/main/categories/widgets/book_review_detail_page.dart';
import 'package:bookhubuz/ui/main/categories/widgets/book_reviews_page.dart';
import 'package:bookhubuz/ui/main/categories/widgets/ebook_page.dart';
import 'package:bookhubuz/ui/main/home/widgets/edit_profile_page.dart';
import 'package:bookhubuz/ui/main/home/widgets/notification_page.dart';
import 'package:bookhubuz/ui/main/home/widgets/profile_page.dart';
import 'package:bookhubuz/ui/main/home/widgets/settings_page.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/bindings/detail_bindings.dart';
import 'package:bookhubuz/bindings/main_bindings.dart';
import 'package:bookhubuz/bindings/splash_bindings.dart';
import 'package:bookhubuz/routes/app_routes.dart';
import 'package:bookhubuz/ui/internet_connection/internet_connection_page.dart';
import 'package:bookhubuz/ui/main/main/main_page.dart';
import 'package:bookhubuz/ui/splash/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: AppRoutes.internetConnection,
      page: () => const InternetConnectionPage(),
    ),
    GetPage(
        name: AppRoutes.buysell,
        page: () => BuySellPage(),
        binding: BuySellBindings()),
    GetPage(
      name: AppRoutes.exchange,
      page: () => const ExchangePage(),
    ),
    GetPage(
      name: AppRoutes.addbook,
      page: () => AddBookPage(),
    ),
    GetPage(
      binding: FillItemsBindings(),
      name: AppRoutes.fillitems,
      page: () => FillItemsPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.audiobookdetail,
      page: () => AudioBookDetailPage(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: AppRoutes.editprofile,
      page: () => const EditProfilePage(),
    ),
    GetPage(
      name: AppRoutes.authentication,
      page: () => AuthenticationView(),
    ),
    GetPage(
      name: AppRoutes.verify_profile_page,
      page: () => VerifyProfilePage(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: AppRoutes.ebook,
      page: () => EbookPage(),
    ),
    GetPage(
      name: AppRoutes.audiobook,
      page: () => AudiobookPage(),
    ),
    GetPage(
        name: AppRoutes.bookreviews,
        page: () => BookReviewsPage(),
        binding: BookReviewsBindings()),
    // GetPage(
    //   name: AppRoutes.bookreviewdetail,
    //   page: () => BookReviewDetailPage(),
    // ),
    // GetPage(
    //   name: AppRoutes.bookdetail,
    //   page: () => BookDetailPage(),
    // ),
    GetPage(
        name: AppRoutes.username,
        page: () => FillProfilePage(),
        binding: UserNameBindings()),

    GetPage(
        name: AppRoutes.addBookReview,
        page: () => AddBookReviewPage(),
        binding: AddBookReviewBindings()),
  ];
}
