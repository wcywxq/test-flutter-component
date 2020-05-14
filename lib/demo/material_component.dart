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
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatActionButtonDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'CheckBox',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Switch',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Slider',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'Datetime',
            page: DatetimeDemo(),
          ),
          ListItem(
            title: 'SimpleDialog',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'AlertDialog',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'BottomSheet',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'SnackBar',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'ExpansionPanel',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'Chip',
            page: ChipDemo(),
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
