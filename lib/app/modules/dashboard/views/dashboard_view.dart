// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Home/views/home_view.dart';
import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Profile/views/profile_view.dart';
import 'package:flutter_e_learning_app_master/app/modules/dashboard/page/Discus/views/discuss_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndex.value;
      return SafeArea(
        child: Scaffold(
          body: IndexedStack(
              index: controller.selectedNavIndex.value, children: _bodyList()),
          floatingActionButton: FloatingActionButton(
            child: Container(
              padding: EdgeInsets.only(top: 10),
                child: Image.asset('assets/icon/discuss_ic.png',width: 35)),
            onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => DiscussView()),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              controller.navigateTo(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: selectedIndex==0 ? Image.asset('assets/icon/home.png',width: 20) : Image.asset('assets/icon/home_ns_ic.png',width: 20),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex==1 ? Image.asset('assets/icon/profile.png',width: 20) : Image.asset('assets/icon/profile_ns_ic.png',width: 20),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomeView(),
        const ProfileView(),
      ];
}
