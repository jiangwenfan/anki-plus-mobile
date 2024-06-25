import 'package:get/get.dart';
import '../../utils.dart';

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
  Future<bool> updateLoginStatus(bool status, String token) async {
    isLogin.value = status;
    // 保存token
    return await writeLocalToken(token);
  }
}
