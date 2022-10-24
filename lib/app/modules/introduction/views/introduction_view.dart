import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_flutter/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  Timer timer =
      new Timer(new Duration(seconds: 3), () => Get.offAllNamed(Routes.HOME));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[800],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              color: Colors.white,
              size: 96,
            ),
            SizedBox(height: 20),
            Text(
              "Chat Apps",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        )));
  }
}
