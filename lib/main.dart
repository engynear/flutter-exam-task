import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/main_screen.dart';
import 'package:flutter_task/ui/themes/exam_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ExamTheme.theme,
      home: const MainScreen(),
    );
  }
}
