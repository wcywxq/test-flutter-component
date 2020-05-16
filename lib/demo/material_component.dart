import 'package:app/demo/stepper_demo.dart';
import 'package:app/demo/card_demo.dart';
import 'package:app/demo/paginated_data_table_demo.dart';
import 'package:app/demo/data_table_demo.dart';
import 'package:app/demo/chip_demo.dart';
import 'package:app/demo/expansion_panel_demo.dart';
import 'package:app/demo/snack_bar_demo.dart';
import 'package:app/demo/bottom_sheet_demo.dart';
import 'package:app/demo/alert_dialog_demo.dart';
import 'package:app/demo/simple_dialog_demo.dart';
import 'package:app/demo/datetime_demo.dart';
import 'package:app/demo/silder_demo.dart';
import 'package:app/demo/switch_demo.dart';
import 'package:app/demo/radio_demo.dart';
import 'package:app/demo/check_box_demo.dart';
import 'package:app/demo/form_demo.dart';
import 'package:app/demo/popup_menu_button_demo.dart';
import 'package:app/demo/floating_action_button_demo.dart';
import 'package:app/demo/button_demo.dart';
import 'package:flutter/material.dart';


class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'Button 按钮',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton 底部按钮',
            page: FloatActionButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton 弹出菜单',
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: 'Form 表单',
            page: FormDemo(),
          ),
          ListItem(
            title: 'CheckBox 多选框',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: 'Radio 单选框',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Switch 开关',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Slider 滑块',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'Datetime 时间选择器',
            page: DatetimeDemo(),
          ),
          ListItem(
            title: 'SimpleDialog 简单弹窗',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'AlertDialog 弹窗',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'BottomSheet 底部弹窗',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'SnackBar 底部提示框',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'ExpansionPanel 折叠面板',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'Chip 标签',
            page: ChipDemo(),
          ),
          ListItem(
            title: 'DataTable 表格',
            page: DataTableDemo(),
          ),
          ListItem(
            title: 'PaginatedDataTable 分页表格',
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: 'Card 卡片',
            page: CardDemo(),
          ),
          ListItem(
            title: 'Stepper 步骤条',
            page: StepperDemo(),
          ),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

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
