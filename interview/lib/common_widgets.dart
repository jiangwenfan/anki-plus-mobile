import 'package:flutter/material.dart';

// 圆圈进度条
class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.green,
      valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
    );
  }
}
