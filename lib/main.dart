import 'package:calculator/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/my_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      title: 'Simple Calculator',
      home: MainScreen(),
    );
  }
}
