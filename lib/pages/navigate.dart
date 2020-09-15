import 'package:flutter/material.dart'; //  引入flutter基础样式
import './index.dart';
import './me.dart';

class KYVMNavigate extends StatefulWidget {
  @override
  _KYVMNavigateState createState() => _KYVMNavigateState();
}

class _KYVMNavigateState extends State<KYVMNavigate> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          PageIndex(),
          Me()
        ],
        physics: NeverScrollableScrollPhysics()
      ),
      bottomNavigationBar: Container(
        decoration: new BoxDecoration(
          boxShadow: [BoxShadow(color: Color(0x99FFFF00), offset: Offset(5.0, 5.0))]
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe61a,fontFamily:'iconfont')), // iconfont16进制前加0
              activeIcon: Icon(IconData(0xe619,fontFamily:'iconfont')),
              title: Text('首页')
            ),
            BottomNavigationBarItem(
              icon: Icon( IconData(0xe62f,fontFamily: 'iconfont')),
              activeIcon: Icon( IconData(0xe608,fontFamily: 'iconfont')),
              title: Text('我的')
            )
          ],
          currentIndex: _currentIndex, // 当前选中项
          unselectedItemColor: Color(0xff999999), // 未选中的色值 16进制色值前加上0xff
          selectedItemColor: Color(0xff61A4FF), // 选中激活的色值
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          } // 点击事件绑定
        )
      )
    );
  }
}