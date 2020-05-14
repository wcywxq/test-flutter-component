import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';

  List<String> _selected = [];

  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo 小标签'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              // 设置 Wrap 小部件内部各小部件的水平间隔
              spacing: 16.0,
              // runSpacing 调整行与行之间的间隔
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('好'),
                  ),
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://resources.ninghao.net/images/wanghao.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  // deleteButtonTooltipMessage 删除操作的提示
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Divider(
                  color: Colors.grey,
                  // height 分隔符的高度
                  height: 32.0,
                  // indent 缩紧
                  // indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((String tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  // height 分隔符的高度
                  height: 32.0,
                  // indent 缩紧
                  // indent: 32.0,
                ),
                // 动作碎片
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((String tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  // height 分隔符的高度
                  height: 32.0,
                  // indent 缩紧
                  // indent: 32.0,
                ),
                // 过滤碎片，类似 Switch
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((String tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  // height 分隔符的高度
                  height: 32.0,
                  // indent 缩紧
                  // indent: 32.0,
                ),
                // 选择碎片，类似 Radio
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: ${_choice}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((String tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];

            _selected = [];

            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
