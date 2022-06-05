import 'package:bookhubuz/ui/main/audiobook/audio_book_page.dart';
import 'package:bookhubuz/ui/main/books/books.dart';
import 'package:bookhubuz/ui/main/books/buy_sell/buy_sell_page.dart';
import 'package:bookhubuz/ui/main/categories/categories_page.dart';
import 'package:bookhubuz/ui/main/categories/widgets/book_reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bookhubuz/controller/main/main_controller.dart';
import 'package:bookhubuz/core/theme/app_colors.dart';
import 'package:bookhubuz/ui/main/home/home_page.dart';
import '../saved/saved_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: IndexedStack(
          index: controller.bottomMenu.index,
          children: [
            HomePage(),
            SavedPage(),
             BuySellPage(),
            const AudioBookPage(),
            const CategoriesPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.unselectedBottomNavItem,
          selectedItemColor: AppColors.mainColor,
          onTap: (pos) => controller.setMenu(BottomMenu.values[pos]),
          currentIndex: controller.bottomMenu.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          elevation: 8,
          items: [
            _bottomNavigationBarItem(
              icon: 'icon_home',
              label: 'home'.tr,
              activeIcon: 'icon_home_active',
            ),
            _bottomNavigationBarItem(
              icon: 'icon_bookmark',
              label: 'saved'.tr,
              activeIcon: 'icon_bookmark_active',
            ),
            _bottomNavigationBarItem(
              icon: 'icon_book',
              label: 'books'.tr,
              activeIcon: 'icon_book_active',
            ),
            _bottomNavigationBarItem(
              icon: 'icon_audio',
              label: 'audio'.tr,
              activeIcon: 'icon_audio_active',
            ),
            _bottomNavigationBarItem(
              icon: 'icon_category',
              label: 'categories'.tr,
              activeIcon: 'icon_category_active',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({
    required String activeIcon,
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$icon.svg'),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$activeIcon.svg'),
      ),
      label: label,
    );
  }
}
