import 'package:app/pages/form_test/index.dart';
import 'package:app/pages/list/index.dart';
import 'package:app/pages/login/index.dart';
import 'package:app/pages/home/index.dart';
import 'package:app/pages/map/index.dart';
import 'package:app/pages/test_home/index.dart';
import 'package:app/pages/token/index.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const LOGIN = AppRoutes.LOGIN;
  static const FORMTEST = AppRoutes.FORMTEST;
  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );

  static final List<GetPage> routes = [
    // 登录页
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      transition: Transition.downToUp,
      binding: LoginBinding(),
    ),

    // 首页
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      transition: Transition.downToUp,
      binding: HomeBinding(),
    ),
    // 表单
    GetPage(
      name: AppRoutes.FORMTEST,
      page: () => FormTestPage(),
      transition: Transition.downToUp,
      binding: FormTestBinding(),
    ),
    // 列表
    GetPage(
      name: AppRoutes.LIST,
      page: () => ListPage(),
      transition: Transition.downToUp,
      binding: ListBinding(),
    ),
    // 地图
    GetPage(
      name: AppRoutes.MAP,
      page: () => MapPage(),
      transition: Transition.downToUp,
      binding: MapBinding(),
    ),
    //样式修改
    GetPage(
      name: AppRoutes.TESTHOME,
      page: () => TestHomePage(),
      transition: Transition.downToUp,
      binding: TestHomeBinding(),
    ),
    //测试token
    GetPage(
      name: AppRoutes.TOKEN,
      page: () => TokenPage(),
      transition: Transition.downToUp,
      binding: TokenBinding(),
    ),
  ];
}
