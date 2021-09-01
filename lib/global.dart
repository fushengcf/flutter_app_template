import 'dart:io';

import 'package:app/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const SERVER_API_URL = 'http://47.101.177.83:8082';
const CLIENT_ID = '1';
const CLIENT_SECRET = '2';
class Global {/// 包信息
  // static late PackageInfo packageInfo;
  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();


    // 工具初始
    await StorageUtil().init();
    HttpUtil();


    // // 读取离线用户信息
    // var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    // if (_profileJSON != null) {
    //   profile = UserLoginResponseEntity.fromJson(_profileJSON);
    //   isOfflineLogin = true;
    // }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}