import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'controller.dart';

final logger = Logger();

class HomeMineView extends GetView<MineController> {
  const HomeMineView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MineView'),
          centerTitle: true,
        ),
        body: Column(children: [
          ElevatedButton(
              child: const Text("管理中心"),
              onPressed: () {
                logger.i("跳转到管理中心");
              }),
        ]));
  }
}
