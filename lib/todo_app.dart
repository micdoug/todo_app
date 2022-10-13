import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Todo App",
      home: Home(),
      
    );
  }
}
