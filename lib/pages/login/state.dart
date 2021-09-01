import 'package:app/entity/user.dart';
import 'package:get/get.dart';

class LoginState {
  // title
  final _title = "".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;

  // var _userProfile = Rx<LoginResponseEntity>.obs;

  var _userProfile = LoginResponseEntity().obs;
  set userProfile(value) => _userProfile.value = value;
  get userProfile => _userProfile.value;

  final _number = 1.obs;
  set number(value) => this._number.value = value;
  get number => this._number.value;
}
