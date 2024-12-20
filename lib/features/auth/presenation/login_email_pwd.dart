import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../data/api.dart';
import '../data/model.dart';

class EmailPwd extends HookConsumerWidget {
  const EmailPwd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final pwdController = useTextEditingController();

    return Column(
      children: [
        // 手机+密码/验证码登录
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "请输入邮箱",
          ),
        ),
        TextField(
          controller: pwdController,
          decoration: const InputDecoration(
            hintText: "请输入密码",
          ),
          // 校验密码
          onChanged: (value) => print("密码改变:$value"),
        ),
        ElevatedButton(
          onPressed: () {
            print(
                "---获取邮箱密码登录---${emailController.text}---${pwdController.text}");
            loginEmailPwd(LoginEmailPwd(
                email: emailController.text, password: pwdController.text));
          },
          child: const Text("登录"),
        )
      ],
    );
  }
}
