import 'package:boiler_plate/controller/dashboard.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boiler_plate/constants/colors.dart';

class BottomnavigationBarCutome extends StatefulWidget {
  BottomnavigationBarCutome({
    Key? key,
    // required PageController pageController,
    required this.userRoll,
  }) : super(key: key);

  // final PageController _pageController;
  final String userRoll;

  @override
  State<BottomnavigationBarCutome> createState() =>
      _BottomnavigationBarCutomeState();
}

class _BottomnavigationBarCutomeState extends State<BottomnavigationBarCutome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var conteroller = Get.find<DashBoardController>();
    return BottomNavyBar(
        selectedIndex: 0,
        showElevation: true, // use this to remove appBar's elevation

        onItemSelected: (index) {
          // conteroller.changeTabIndex(index);
          // widget._pageController.animateToPage(conteroller.tabIndex.value,
          //     duration: const Duration(milliseconds: 50), curve: Curves.ease);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.help,
              size: MediaQuery.of(context).size.width <= 320 ? 20 : 28,
            ),
            title: MediaQuery.of(context).size.width <= 320
                ? const Text("")
                : Text('Home'.tr),
            activeColor: AppColors.primarycolor,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.document_scanner,
              size: MediaQuery.of(context).size.width <= 320 ? 20 : 28,
            ),
            title: MediaQuery.of(context).size.width <= 320
                ? const Text("")
                : Text('Testing'.tr),
            activeColor: AppColors.primarycolor,
          ),
          BottomNavyBarItem(
              icon: Icon(
                Icons.lightbulb_outline,
                size: MediaQuery.of(context).size.width <= 320 ? 20 : 28,
              ),
              title: MediaQuery.of(context).size.width <= 320
                  ? const Text("")
                  : Text('Testing'.tr),
              activeColor: AppColors.primarycolor),
        ]);
  }
}
