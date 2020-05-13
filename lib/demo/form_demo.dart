import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      // body: Theme(
      // ThemeData 将完全覆盖之前定义的主题
      // data: ThemeData(
      //   primaryColor: Colors.black,
      // ),
      // child: ThemeDemo(),
      // ),
      body: Theme(
        // Theme.of(context).copyWith 将覆盖某些特定的主题
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// form 包裹表单
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // 为 form 表单设置 key 值
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm() {
    // registerFormKey.currentState.validate 表单校验
    if (registerFormKey.currentState.validate()) {
      // registerFormKey.currentState.save 保存表单中 save 填写的数据
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');

      // 注册成功将在底部出现的 正在注册的提示
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering...'),
        ),
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return 'Username is required!';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return 'Password is required!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              // 使表单校验时出现的错误信息更自然
              helperText: '',
            ),
            // 保存表单数据，继承自 FormField
            onSaved: (value) {
              username = value;
            },
            // validator 表单校验
            validator: validatorUsername,
            // autovalidate 自动校验
            autovalidate: autovalidate,
          ),
          TextFormField(
            // obscureText 隐藏输入的内容
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

// textfield demo
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  // 文本编辑控制器
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 释放控制器，节省资源
    textEditingController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text 设置文本字段初始值
    // textEditingController.addListener 监听文本框
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextField 底部边框的颜色会使用 primaryColor 使用的颜色
    return TextField(
      // onChanged: (value) {
      //   debugPrint('input: $value');
      // },
      // 确定按钮的事件
      onSubmitted: (value) {
        debugPrint('submit: $value');
      },
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'title',
        // 文本框进入焦点状态时候的 placeholder
        hintText: 'Enter the title',
        // InputBorder.none 去掉底部边框, OutlineInputBorder 给四周加边框
        // border: InputBorder.none,
        // border: OutlineInputBorder(),
        // filled 为 true 将会设置带有背景颜色的文本框
        filled: true,
      ),
    );
  }
}

// 主题 demo
class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      color: Theme.of(context).accentColor,
    );
  }
}
