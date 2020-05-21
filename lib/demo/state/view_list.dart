import 'package:flutter/material.dart';
import 'package:app/demo/state/view_list/%E7%88%B6%E4%BC%A0%E5%AD%90(%E6%9C%80%E5%9F%BA%E6%9C%AC).dart';
import 'package:app/demo/state/view_list/%E7%88%B6%E4%BC%A0%E5%AD%90(%E7%9B%B4%E6%8E%A5%E4%BC%A0%E9%80%92%E6%95%B0%E6%8D%AE).dart';
import 'package:app/demo/state/view_list/%E7%AC%AC%E4%B8%89%E6%96%B9(scope_model).dart';

class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('操作数据的方式'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: '最基本的传递方式',
            page: StateManagementBaseDemo(),
          ),
          ListItem(
            title: '直接传递数据',
            page: StateManagementDirectDemo(),
          ),
          ListItem(
            title: '第三方包：scope_model',
            page: ScopeModelStateManagementDemo(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({ this.title, this.page });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => page),
        );
      },
    );
  }
}
