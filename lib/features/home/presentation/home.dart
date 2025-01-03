import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:logger/logger.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../providers/notep.dart';
import '../../../providers/login.dart';

final logger = Logger();

// 模拟远程数据提供器
// final remoteDataProvider = FutureProvider<String>((ref) async {
//   // 模拟一个网络请求
//   await Future.delayed(Duration(seconds: 2));
//   return "远程数据加载成功";
//   // 模拟加载失败
//   // throw Exception("加载失败");
// });

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Map<String, dynamic> loginState = ref.read(loginNotifierProvider);
    final container = ProviderScope.containerOf(context);
    Map<String, dynamic> loginState = container.read(loginNotifierProvider);
    print("home中,${loginState}");

    // 使用 useEffect 钩子在组件挂载时触发
    useEffect(() {
      // 监听远程数据提供器
      // final future = ref.read(.future);
      final future = ref.read(notepProvider.future);
      future.then((value) {
        debugPrint("远程数据已加载: $value");
      }).catchError((error) {
        debugPrint("加载失败: $error");
      });

      // 返回 null 或一个清理函数
      return null;
    }, []); // 依赖为空数组，确保只在挂载时运行

    // 获取远程数据状态
    final asyncData = ref.watch(notepProvider);

    return Scaffold(
      appBar: AppBar(
        // title: Obx(() => controller.titles[controller.currentTabIndex.value]),
        title: Container(
          width: double.infinity,
          // height: 80,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "note",
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                    // 在 AppBar 中添加一个菜单按钮
                    Expanded(
                      flex: 1,
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          // 菜单项点击事件
                          print("你选择了: $value");
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('编辑列表'),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'notifications',
                            child: ListTile(
                              leading: const Icon(Icons.notifications),
                              title: const Text('通知'),
                            ),
                          ),
                          PopupMenuDivider(), // 分割线
                          const PopupMenuItem(
                            value: 'celsius',
                            child: Row(
                              children: const [
                                Icon(Icons.check, color: Colors.blue),
                                SizedBox(width: 10),
                                Text('摄氏度'),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'fahrenheit',
                            child: Row(
                              children: const [
                                Icon(null), // 空图标保持对齐
                                SizedBox(width: 10),
                                Text('华氏度'),
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          const PopupMenuItem(
                            value: 'unit',
                            child: ListTile(
                              leading: const Icon(Icons.bar_chart),
                              title: const Text('单位'),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'report',
                            child: ListTile(
                              leading: const Icon(Icons.report_problem),
                              title: const Text('报告问题'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 120,
        centerTitle: true,
        // #f3f2f6
        backgroundColor: const Color(0xFFF3F2F6),
        // actions: [Text("hhh")],
      ),
      // 右抽屉

      // endDrawer: Drawer(
      //   child: Text("hello"),
      // ),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     currentIndex: controller.currentTabIndex.value,
      //     onTap: (index) {
      //       controller.currentTabIndex.value = index;
      //       logger.i("底部tab被点击,索引:$index");
      //     },
      //     items: controller.tabs,
      //   ),
      // ),
      // body: Obx(() => controller.tabsWidget[controller.currentTabIndex.value]),
      body: asyncData.when(
        data: (data) => ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Note(
              title: "文字1文字2",
              desc: "描述123描述34",
              noteId: index,
              totalQuestions: 78,
            );
          },
          itemCount: 20,
        ),
        loading: () => CircularProgressIndicator(),
        error: (err, stack) => Text("加载失败: $err"),
      ),
    );
  }
}

// note
class Note extends HookConsumerWidget {
  final String title;
  final String? desc;
  final int totalQuestions;
  final int noteId;

  const Note(
      {super.key,
      required this.title,
      required this.totalQuestions,
      this.desc,
      required this.noteId});
  void doNothing(BuildContext context) {}

  // final controller = SlidableController();
  // late final controller = SlidableController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
        key: ValueKey(noteId),
        // controller: controller,
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) {
                // 示例：显示弹窗
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("查看详细 $noteId")),
                );
              },
              backgroundColor: Color.fromARGB(255, 73, 142, 215),
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: '详细',
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context) {
                // 示例：显示弹窗
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("删除成功 $noteId")),
                );
              },
              backgroundColor: Color.fromARGB(255, 214, 48, 7),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: '删除',
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(255, 255, 255, 1)),
          child: ListTile(
            title: Container(
              height: 70,
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                  Text(totalQuestions.toString(),
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            subtitle: Container(
              child: desc == null
                  ? null
                  : Text(desc!, style: TextStyle(fontSize: 17)),
              height: 40,
              padding: EdgeInsets.all(7),
            ),
            onTap: () {
              logger.i("Note $noteId clicked");
            },
          ),
        ));
  }
}
