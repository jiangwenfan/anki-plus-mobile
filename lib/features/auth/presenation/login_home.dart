import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'login_email_pwd.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

class LoginHome extends HookConsumerWidget {
  const LoginHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isLoading = ref.watch(isLoadingProvider);

    // 使用 ref.listen 来监听 provider 的变化
    ref.listen<bool>(
      isLoadingProvider,
      (previous, next) {
        // previous 是之前的值，next 是当前的新值
        // if (next == 5) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Counter reached 5!')),
        //   );
        // }
        if (next) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
    );

    return Scaffold(
        appBar: AppBar(title: const Text('登陆'), backgroundColor: Colors.white),
        body: LoaderOverlay(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(249, 249, 249, 1),
            child: Column(
              children: [
                const SizedBox(height: 30),
                EmailPwd(),
                // 第三方登录,流式布局，每行显示3个
                //   Wrap(
                //     alignment: WrapAlignment.center,
                //     spacing: 20,
                //     runSpacing: 10,
                //     children: [
                //       IconButton(
                //         onPressed: () {},
                //         icon: const Icon(Icons.login_outlined, size: 80),
                //       ),
                //       IconButton(
                //           onPressed: () {},
                //           icon: const Icon(Icons.home_filled, size: 80))
                //     ],
                //   ),
                const SizedBox(height: 60),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("其他登陆方式")],
                  ),
                ),
                const Column(
                  children: [
                    OtherLogin(title: "使用Apple继续", icon: Icons.login_outlined),
                    OtherLogin(title: "使用微信继续", icon: Icons.home_filled),
                    OtherLogin(title: "使用google继续", icon: Icons.search),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("注册即表示我同意"),
                      TextButton(child: const Text("《隐私声明》"), onPressed: () {}),
                      const Text("和"),
                      TextButton(onPressed: () {}, child: const Text("《服务条款》")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

/*
ElevatedButton(
                  onPressed: () async {
                    // 发送登录请求,获取token
                    String token = "1212";
                    // 更新登录状态
                    bool status =
                        await controller.updateLoginStatus(true, token);
                    if (status) {
                      Get.offAndToNamed(Routes.home);
                    } else {
                      Get.snackbar("msg", "登录失败");
                    }
                  },
                  child: Text('登陆成功 ${controller.isLogin.value}'))
*/

class OtherLogin extends HookConsumerWidget {
  final IconData icon;
  final String title;
  const OtherLogin({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
