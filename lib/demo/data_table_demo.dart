import 'package:app/model/post.dart';
import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;

  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              // sortColumnIndex 排序列的索引号
              sortColumnIndex: _sortColumnIndex,
              // sortAscending 表格当前用的排序方法 true 升序
              sortAscending: _sortAscending,
              // onSelectAll 定制全选的动作
              // onSelectAll: (bool value) {},
              columns: [
                DataColumn(
                    label: Container(
                      width: 50.0,
                      child: Text('Title'),
                    ),
                    onSort: (int columnIndex, bool ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;

                        posts.sort((a, b) {
                          if (!ascending) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    }),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              rows: posts.map((Post post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool value) {
                    setState(() {
                      if (post.selected != value) {
                        post.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imgUrl)),
                  ],
                );
              }).toList(),
//              rows: [
//                DataRow(cells: [
//                  DataCell(Text('hello ~')),
//                  DataCell(Text('wanghao ~')),
//                ]),
//                DataRow(cells: [
//                  DataCell(Text('hello1 ~')),
//                  DataCell(Text('wanghao1 ~')),
//                ]),
//                DataRow(cells: [
//                  DataCell(Text('hello2 ~')),
//                  DataCell(Text('wanghao2 ~')),
//                ]),
//              ],
            ),
          ],
        ),
      ),
    );
  }
}
