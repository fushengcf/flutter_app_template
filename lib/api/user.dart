import 'package:app/entity/user.dart';
import 'package:app/utils/http.dart';

//用户信息
class UserAPI {
//登录
  static Future<LoginResponseEntity> login(data) async {
    var response = await HttpUtil().request('post', '/oauth/token', data: data);
    return LoginResponseEntity.fromJson(response);
  }
}
