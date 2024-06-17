import 'package:flutter/material.dart';

class AdminView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminViewState();
  }
}

class AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("je")),
      body: Column(children: [
        ElevatedButton(child: Text("添加分类"), onPressed: () {}),
        ElevatedButton(child: Text("添加问题"), onPressed: () {}),
      ]),
    );
  }
}
