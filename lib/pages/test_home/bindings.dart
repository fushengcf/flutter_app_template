import 'package:get/get.dart';

import 'controller.dart';

class TestHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestHomeController>(() => TestHomeController());
  }
}
