import 'package:flutter/material.dart'; //  引入flutter基础样式
import './pages/navigate.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KYVMNavigate(), // 引入作为导航布局的组件页面
      debugShowCheckedModeBanner: true
    );
  }
}

