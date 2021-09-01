import 'package:get/get.dart';

import 'controller.dart';

class TokenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokenController>(() => TokenController());
  }
}
