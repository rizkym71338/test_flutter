import 'package:get/get.dart';

import 'package:test_flutter/app/modules/detail_status/bindings/detail_status_binding.dart';
import 'package:test_flutter/app/modules/detail_status/views/detail_status_view.dart';
import 'package:test_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:test_flutter/app/modules/home/views/home_view.dart';
import 'package:test_flutter/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:test_flutter/app/modules/introduction/views/introduction_view.dart';
import 'package:test_flutter/app/modules/setting/bindings/setting_binding.dart';
import 'package:test_flutter/app/modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STATUS,
      page: () => DetailStatusView(),
      binding: DetailStatusBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
