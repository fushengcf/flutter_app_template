import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_picker/Picker.dart';

import 'index.dart';

class FormTestController extends GetxController {
  FormTestController();

  /// 响应式成员变量

  final state = FormTestState();
  final genderOptions = ['Male', 'Female', 'Other'];
  List<dynamic> pickerData =
[
    {
        "a": [
                "b1",
                "b2",
                "b3",
        ]
    }
]
  ;

  /// 成员变量

  /// 事件

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

   showPickerModal(BuildContext context) async {
    final result = await Picker(
      adapter: PickerDataAdapter<String>(pickerdata: pickerData),
      changeToFirst: true,
      hideHeader: false,
      selectedTextStyle: TextStyle(color: Colors.blue),
      // builderHeader: (context) {
      //   final picker = PickerWidget.of(context);
      //   return picker?.data?.title ?? Text("xxx");
      // },
      cancelText: "取消",
      confirmText: "确认",
      onConfirm: (picker, value) {
        print(value.toString());
        print(picker.adapter.text);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
        //   appBar: AppBar(title: Text("Hello")),
        //   body: Center(child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("You click the Confirm button."),
        //       SizedBox(height: 32),
        //       Text("result: \n ${picker.adapter.text}")
        //     ],
        //   )),
        // )));
      }
    ).showModal(context); //_sca
    print("result: $result");// ffoldKey.currentState);
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() {
    super.onReady();
    // async 拉取数据
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于
  ///处理控制器使用的资源。就像 closing events 一样，
  ///或在控制器销毁之前的流。
  ///或者处置可能造成一些内存泄漏的对象，
  ///像 TextEditingControllers、AnimationControllers。
  ///将一些数据保存在磁盘上也可能很有用。
  @override
  void onClose() {
    super.onClose();
    // 1 stop & close 关闭对象
    // 2 save 持久化数据
  }

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    // dispose 释放对象
  }
}
