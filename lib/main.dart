import 'package:flutter/material.dart';
import 'product/auth/auth_view.dart';

Future<void> main() async {
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
      home: const AuthView(),
    );
  }
}
