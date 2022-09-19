import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zemin_istanbul_hive_app/product/todo/todo_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive App',
      theme: ThemeData.dark(),
      home: const TodoView(),
    );
  }
}
