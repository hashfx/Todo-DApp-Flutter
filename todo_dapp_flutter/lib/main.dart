import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_dapp_flutter/TodoList.dart';
import 'package:todo_dapp_flutter/TodoListModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListModel(),
      child: MaterialApp(
        title: 'Flutter Dapp ToDo',
        home: TodoList(),
      ),
    );
  }
}