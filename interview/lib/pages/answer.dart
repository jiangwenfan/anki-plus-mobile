import 'package:flutter/material.dart';

class AnswerPage extends StatefulWidget {
  final Map arguments;
  const AnswerPage({super.key, required this.arguments});

  @override
  AnswerPageState createState() => AnswerPageState();
}

class AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Answer Page'),
        ),
        body: const Text("answer page"));
  }
}
