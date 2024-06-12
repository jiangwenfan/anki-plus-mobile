import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MineView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '技术名称',
                ),
              ),
              // DropdownButton(items: [DropdownMenuItem(child: Text("language"))]), onChanged: (String? value){})
            ],
          ),
        ),
      ),
    );
  }
}
