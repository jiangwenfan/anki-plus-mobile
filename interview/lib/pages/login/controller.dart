import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // 是否已经登录
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 更新登录状态
  void updateLoginStatus(bool status, String token) {
    isLogin.value = status;
    // 保存token
  }
}
