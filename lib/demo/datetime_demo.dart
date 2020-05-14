import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'dart:async';

class DatetimeDemo extends StatefulWidget {
  @override
  _DatetimeDemoState createState() => _DatetimeDemoState();
}

class _DatetimeDemoState extends State<DatetimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectedDate() async {
    // 日期选择器点击 ok 将返回 Future 类型，点击 cancel 将返回 null
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate, // 初始日期
      firstDate: DateTime(1900), // 可选择的最早日期
      lastDate: DateTime(2100), // 可选择的最晚日期
    );

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectedTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time == null) return;

     setState(() {
       selectedTime = time;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatetimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectedDate,
                  child: Row(
                    children: <Widget>[
                      // DateFormat intl包的方法
                      Text(DateFormat.yMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectedTime,
                  child: Row(
                    children: <Widget>[
                      // DateFormat intl包的方法
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
