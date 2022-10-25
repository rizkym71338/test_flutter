import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:test_flutter/app/modules/setting/views/setting_view.dart';
import 'package:test_flutter/app/widgets/list_call.dart';
import 'package:test_flutter/app/widgets/list_chat.dart';
import 'package:test_flutter/app/widgets/list_status.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Apps',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: controller.isSelected.value == true
            ? Colors.green[900]
            : Colors.green[800],
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Obx(
            () => controller.activeTab.value == 0
                ? PopupChatMenu()
                : controller.activeTab.value == 1
                    ? PopupStatusMenu()
                    : PopupCallMenu(),
          ),
        ],
        bottom: TabBar(
          controller: controller.tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Text(
                "CHATS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "STATUS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "CALLS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          ListChat(),
          ListStatus(),
          ListCall(),
        ],
      ),
      floatingActionButton: Obx(
        () => controller.activeTab.value == 0
            ? FloatingActionButton(
                onPressed: () {
                  Get.snackbar("Error", "Something went wrong",
                      snackPosition: SnackPosition.BOTTOM);
                },
                backgroundColor: Colors.green[800],
                child: Icon(Icons.message),
              )
            : controller.activeTab.value == 1
                ? Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            Icons.edit,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.green[800],
                          child: Icon(Icons.camera_alt),
                        ),
                      )
                    ],
                  )
                : FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.green[800],
                    child: Icon(Icons.add_ic_call),
                  ),
      ),
    );
  }
}

class PopupChatMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("New group"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("New broadcast"),
          value: 2,
        ),
        PopupMenuItem(
          child: Text("Starred messages"),
          value: 3,
        ),
        PopupMenuItem(
          child: Text("Settings"),
          value: 4,
        ),
      ],
      onSelected: (value) {
        if (value == 4) {
          Get.to(SettingView(), transition: Transition.rightToLeftWithFade);
        }
      },
    );
  }
}

class PopupStatusMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Status privacy"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Settings"),
          value: 2,
        ),
      ],
      onSelected: (value) {
        if (value == 2) {
          Get.to(SettingView(), transition: Transition.rightToLeftWithFade);
        }
      },
    );
  }
}

class PopupCallMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Clear call log"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Settings"),
          value: 2,
        ),
      ],
      onSelected: (value) {
        if (value == 2) {
          Get.to(SettingView(), transition: Transition.rightToLeftWithFade);
        }
      },
    );
  }
}
