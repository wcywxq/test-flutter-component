import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

// with TickerProviderStateMixin 设置为帧动画
class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      // vsync 防止屏幕外不需要的动画效果占用资源
      vsync: this,
    );

    // Curve 设置动画的速度曲线，匀速等
    curve = CurvedAnimation(
      parent: animationDemoController,
      curve: Curves.bounceOut,
    );

    // Tween 用来设置动画范围的值
    // animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    // animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
    //     .animate(animationDemoController);
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    // addListener 数据每一帧动画上的值
    animationDemoController.addListener(() {
      // print('${animationDemoController.value}');
      setState(() {});
    });

    // 监听动画运行状态
    // animationDemoController.addStatusListener((AnimationStatus status) {
    //   print(status);
    // });

    // 开始播放动画
    // animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ActionChip(
      //   label: Text('${animationDemoController.value}'),
      //   onPressed: () {
      //     animationDemoController.forward();
      //   },
      // ),
      child: AnimatedHeart(
        animations: [animation, animationColor],
        controller: animationDemoController,
      ),
    );
  }
}

// AnimatedWidget 动画值有变化就会重建自己
class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  // listenable 表示可以监听的部分
  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      // iconSize: animationDemoController.value,
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse(); // 倒退播放动画
            break;
          default:
            controller.forward(); // 正向播放动画
        }
      },
    );
  }
}
