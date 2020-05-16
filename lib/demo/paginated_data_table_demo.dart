import 'package:app/model/post.dart';
import 'package:flutter/material.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false; // 不确定行数量可返回 true

  @override
  int get selectedRowCount => _selectedCount; // 获取选中行时会执行该方法

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];

    // 返回每一行的具体内容
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imgUrl)),
      ],
    );
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;

  bool _sortAscending = true;

  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              // rowsPerPage 显示每页显示的行数
              rowsPerPage:  5,
              // 数据内容
              source: _postsDataSource,
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
                      // 第一个参数：用标题的长度作为排序的依据，第二个参数为排序方式
                      _postsDataSource._sort((post) => post.title.length, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
