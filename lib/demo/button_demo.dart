import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 基本按钮
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          onPressed: () {},
          label: Text('Button'),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    // RaisedButton 带有阴影和背景的按钮
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          // data: ThemeData(),
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // BeveledRectangleBorder 直角类型的 border
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              // StadiumBorder 圆角border，类似足球场
              shape: StadiumBorder(),
            ),
            // ButtonTheme.of(context).copyWith 覆盖按钮主题中某几个特定的地方
            // buttonTheme: ButtonTheme.of(context).copyWith(
            //   textTheme: ButtonTextTheme.primary,
            // ),
          ),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey,
            color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
            elevation: 0.0,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          onPressed: () {},
          label: Text('Button'),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 12.0,
        ),
      ],
    );

    // 描边按钮
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          // data: ThemeData(),
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // BeveledRectangleBorder 直角类型的 border
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              // StadiumBorder 圆角border，类似足球场
              shape: StadiumBorder(),
            ),
            // ButtonTheme.of(context).copyWith 覆盖按钮主题中某几个特定的地方
            // buttonTheme: ButtonTheme.of(context).copyWith(
            //   textTheme: ButtonTextTheme.primary,
            // ),
          ),
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          onPressed: () {},
          label: Text('Button'),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    // 带有固定宽度的按钮
    final Widget fixedWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    // 占满可用宽度的 button
    final Widget expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            color: Theme.of(context).accentColor,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    // 并排显示的按钮
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              // EdgeInsets.symmetric 水平间距
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                color: Theme.of(context).accentColor,
                // textColor: Colors.white,
                // textTheme: ButtonTextTheme.primary,
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                color: Theme.of(context).accentColor,
                // textColor: Colors.white,
                // textTheme: ButtonTextTheme.primary,
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButtonDemo,
            expandedButtonDemo,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}