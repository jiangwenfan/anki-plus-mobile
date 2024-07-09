import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes.dart';

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
      body: const Column(children: []),
    );
  }
}
