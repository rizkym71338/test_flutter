import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt activeTab = 0.obs;
  RxBool isSelected = false.obs;

  late TabController tabController;

  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(
      () {
        if (!tabController.indexIsChanging) {
          activeTab.value = tabController.index;
        }
      },
    );
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    update();
  }
}
