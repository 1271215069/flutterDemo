import 'package:flutter/material.dart'; //  引入flutter基础样式
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    return Container(child: Text('常用数据类型，请看控制台输出'),);
  }
  void _numType () {
    num num1 = - 1.0; // 数字类型的父类
    num num2 = 2;
    int num3 = 1;
    double num4 = 2.34;
    print("num1: $num1");
  }
}