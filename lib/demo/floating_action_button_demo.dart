import 'package:flutter/material.dart';

class FloatActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 可设置为多边形的漂浮按钮，通过 shape 属性设置
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0),
      // ),
    );

    // 带有文字，图标和圆角的漂浮按钮，类似足球场
    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatActionButtonDemo'),
        elevation: 0.0,
      ),
      // floatingActionButton: _floatingActionButton,
      floatingActionButton: _floatingActionButton,
      // floatingActionButtonLocation 调整漂浮按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        // CircularNotchedRectangle 切出与按钮形状相符的缺口
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}