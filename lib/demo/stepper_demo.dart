import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                // currentStep 控制当前打开非步骤
                currentStep: _currentStep,
                // onStepTapped 按下步骤序号触发的回调
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                // onStepContinue 点击了继续按钮
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                // onStepContinue 点击了取消按钮
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: <Step>[
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字'),
                    // isActive 激活状态
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('Chose Plan'),
                    subtitle: Text('Login second'),
                    content: Text('这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字'),
                    // isActive 激活状态
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Login third'),
                    content: Text('这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字这是一行文字'),
                    // isActive 激活状态
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
