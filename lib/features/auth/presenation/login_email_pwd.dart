import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/api.dart';
import '../data/model.dart';
import './login_home.dart';
import 'package:interview/providers/login.dart';

class EmailPwd extends HookConsumerWidget {
  EmailPwd({super.key});
  final emailController = useTextEditingController(text: "123@123.com");
  final pwdController = useTextEditingController(text: "123");

  // 当2个输入框都输入完成之后,状态设置为true
  // final loginEmailPwd = ref.watch(loginEmailPwdProvider);
  final inputComplete = useState(false);

  // 当开始登陆的时候,设置为true
  // final isLoading = useState(false);

  void checkInput(value) {
    // 校验密码
    // 判断输入是否完成
    if (value.isNotEmpty && pwdController.text.isNotEmpty) {
      inputComplete.value = true;
    } else {
      inputComplete.value = false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(47 / 3),
          // 实际像素/设备像素密度 = 逻辑像素
          width: 1080 / 3.0,
          height: 200,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              // 手机+密码/验证码登录
              TextField(
                controller: emailController,
                onChanged: checkInput,
                decoration: const InputDecoration(
                  labelText: "账号",
                  labelStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  // 提示文字
                  hintText: "手机号码 或 邮件地址",
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                  border: UnderlineInputBorder(), // 底部线条
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // 聚焦时的底部线条颜色
                  ),
                ),
              ),
              TextField(
                controller: pwdController,
                onChanged: checkInput,
                decoration: const InputDecoration(
                  labelText: "密码",
                  labelStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  hintText: "必填",
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 48 / 3),
          width: 1080 / 3,
          height: 55,
          child: ElevatedButton(
            // padding: 48px
            onPressed: inputComplete.value
                ? () async {
                    print(
                        "---获取邮箱密码登录---${emailController.text}---${pwdController.text}");
                    // 更新isLoading为true
                    final isLoading = ref.read(isLoadingProvider.notifier);
                    isLoading.state = true;

                    final res = await loginEmailPwd(LoginEmailPwd(
                        email: emailController.text,
                        password: pwdController.text));

                    // 写入token
                    dynamic accessToken = res!["access_token"];
                    print("写入token: ${res},更新状态: ${accessToken}");
                    // 更新全局登陆状态
                    ref
                        .read(loginNotifierProvider.notifier)
                        .updateToken(accessToken);
                    ref.read(loginNotifierProvider.notifier).setLogin(true);

                    // loginState.value = {
                    //   "isLogin": true,
                    //   "token": accessToken,
                    // };

                    // 更新isLoading为false
                    isLoading.state = false;

                    // 跳转
                    context.go("/home");
                    print("跳转到home");
                    print("当前状态: ${ref.read(loginNotifierProvider)}");
                  }
                : null,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Color.fromRGBO(163, 194, 240, 1),
              backgroundColor: Colors.blue, // 按钮背景色
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 圆角
              ),
            ),
            child: const Text(
              "登录",
              style: TextStyle(
                color: Colors.white, // 字体颜色
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
