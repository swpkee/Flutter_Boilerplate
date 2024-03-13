import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/navigation/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routers = Routers();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // hook up router to MaterialApp
      routerConfig: _routers.config(),
    );
  }
}
