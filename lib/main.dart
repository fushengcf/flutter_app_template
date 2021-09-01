import 'package:app/global.dart';
import 'package:app/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


GlobalKey globalKey = GlobalKey();

Future<void> main() async{
  await initServices();
  runApp(MyApp());
  //   if (Platform.isAndroid) {
  //   // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

Future<void> initServices() async {
  print('starting services ...');
  await Global.init();
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        // 日志
        enableLog: true,
        // logWriterCallback: Logger.write,

        // 路由
        getPages: AppPages.routes,
        // unknownRoute: AppPages.unknownRoute,

        // 启动页面
        initialRoute:AppPages.LOGIN,
        // initialBinding: SplashBinding(),
        // home: SplashPage(),

        // 多语言
        // locale: TranslationService.locale,
        // fallbackLocale: TranslationService.fallbackLocale,
        // translations: TranslationService(),

        // 主题
        // theme: appThemeData,
      ),
    );
  }
}

