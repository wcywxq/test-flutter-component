import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // CheckboxListTile 在 ListTile 中包装了 Checkbox
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text('CheckboxItemA'),
              subtitle: Text('description'),
              // secondary 设置图标
              secondary: Icon(Icons.bookmark),
              // selected 标题或图标是否是激活的颜色
              selected: _checkboxItemA,
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Checkbox(
//                  value: _checkboxItemA,
//                  onChanged: (value) {
//                    setState(() {
//                      _checkboxItemA = value;
//                    });
//                  },
//                  // 勾选状态下复选框的颜色
//                  activeColor: Colors.black,
//                ),
//              ],
//            ),
          ],
        ),
      ),
    );
  }
}
