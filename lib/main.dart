import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/service_locator.dart';
import 'package:flutter_mvvm/util/routers.dart';

void main() {
  initServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
