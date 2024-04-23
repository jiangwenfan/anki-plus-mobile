import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/question_answer_controller.dart';

class QuestionAnswerView extends GetView<QuestionAnswerController> {
  const QuestionAnswerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestionAnswerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuestionAnswerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
