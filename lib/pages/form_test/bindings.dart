import 'package:get/get.dart';

import 'controller.dart';

class FormTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormTestController>(() => FormTestController());
  }
}
