import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class HelloWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ElevatedButton(onPressed:()=> Get.toNamed('/form'), child: Text('表单提交')),
          ElevatedButton(onPressed: () => Get.toNamed('/list'), child: Text('下拉滚动')),
          ElevatedButton(onPressed: () => Get.toNamed('/map'), child: Text('集成地图')),
          ElevatedButton(onPressed: () => Get.toNamed('/test_home'), child: Text('样式修改')),
          ElevatedButton(onPressed: () => Get.toNamed('/token'), child: Text('测试token')),
        ],
      ),
    );
  }
}
