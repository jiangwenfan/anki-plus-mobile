import 'package:get/get.dart';

class QAController extends GetxController {
  // 问题是否被查看答案了
  final RxBool isAnswered = false.obs;

  // 问题列表
  final List<Map<String, dynamic>> questionList = [
    {
      "id": 1,
      "title": "React Portals有什么用?11",
      "difficulty": "简单11",
      "tags": ["React11"],
      "answer": "React Portals是一种将子组件渲染到父组件之外的技术11。"
    },
    {
      "id": 2,
      "title": "React Portals有什么用?22",
      "difficulty": "简单22",
      "tags": ["React22"],
      "answer": """
  # answer
  ## React Portals有什么用?
  ### 答案
  ```python
  def hello():
    print('hello')
  
  hello()
  ```
  test....
  1. 1212
  2. 2221
  11

  ### controller

控制器的生命周期函数，当把控制器初始化配置到路由上之后：

- 当这个路由打开的时候先执行init
- 然后执行ready
- 最后当退出路由的时候执行close.

所以说只有把控制器绑定到路由上之后才有销毁概念，绑定的全局是不会被销毁的。



>  程序进入/index路径indexPage页面
>
> 通过点击按钮，进入/home页面



```dart
// [1] router.dart
class AppPage {
  static final routes = [
    
    GetPage(name: "/home",
            //在路由跳转的时候实现控制器的实例化
            binding: AllControllerBinding(),
            page: () => HomePage()
           ),
    GetPage(name: "/index",
            page: () => IndexPage()
           ),
    GetPage(name: "/news",
          	page: () => NewsPage(),
  ```

  home

```dart
class HomePageState extends State {
  //获取控制器实例
  CounterController counterController = Get.find<CounterController>();
  ListController listController = Get.find<ListController>();

  Scaffold(

      body: Column(
        children: [
          Obx(() => Text("计数器:er}")),
          
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/news", arguments: {"name": "jwf", "id": 43});
              },
              child: Text("跳转")),
          
          Obx(() => Text("数据)),
        ],
     ),
    
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
            counterController.inc();

            listController.add(99);
        },
      ),
);
```
"""
    },
    {
      "id": 3,
      "title": "React Portals有什么用?33",
      "difficulty": "简单33",
      "tags": ["React33"],
      "answer": "React Portals是一种将子组件渲染到父组件之外的技术33。"
    },
  ];

  final RxInt questionIndex = 0.obs;

  // 获取当前问题
  Map getCurrentQuestion(questionIndex) {
    print("questionIndex.value: ${questionIndex}");
    return questionList[questionIndex];
  }

  // 获取上一个问题索引
  int getPrevQuestionIndex() {
    int prevQuesIndex = questionIndex.value - 1;
    print("当前问题索引: ${questionIndex.value} 上一个问题索引: ${prevQuesIndex}");
    return prevQuesIndex;
  }

  // 获取下一个问题索引
  int getNextQuestionIndex() {
    int nextQuesIndex = questionIndex.value + 1;
    print("当前问题索引: ${questionIndex.value} 下一个问题索引: ${nextQuesIndex}");
    return nextQuesIndex;
  }
}
