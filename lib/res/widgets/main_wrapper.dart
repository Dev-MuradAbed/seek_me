import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../index.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final MainWrapperController controller = Get.put(MainWrapperController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: controller.animateToTab,
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          // HomeView(),
          Scaffold(
            backgroundColor: Colors.red,
          ),
          Scaffold(
            backgroundColor: Colors.green,
          ),
          // HomeView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ZoomContainer(
                icon: IconAssets.categoryIcon,
                page: 0,
                label: 'Home',
              ),
              ZoomContainer(
                icon: IconAssets.documentIcon,
                page: 1,
                label: 'Bookings',
              ),
              ZoomContainer(
                icon: IconAssets.walletIcon,
                page: 2,
                label: 'Wallet',
              ),
              ZoomContainer(
                icon: IconAssets.profileIcon,
                page: 3,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZoomContainer extends StatelessWidget {
  ZoomContainer(
      {required this.icon, required this.label, required this.page, super.key});
  final String icon;
  final String label;
  final int page;

  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.factorIcon(1.5);
        controller.goToTab(page);
      },
      onTapUp: (_) {
        controller.factorIcon(1.0);
      },
      child: Transform.scale(
        scale: controller.scaleFactor.value,
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                    controller.currentPage.value == page
                        ? const Color(0xFF5E17EB)
                        : Colors.grey,
                    BlendMode.srcIn),
              ),
              Text(
                label,
                style: TextStyle(
                    color: controller.currentPage.value == page
                        ? const Color(0xFF5E17EB)
                        : Colors.grey,
                    fontSize: 12,
                    fontWeight: controller.currentPage.value == page
                        ? FontWeight.w600
                        : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
