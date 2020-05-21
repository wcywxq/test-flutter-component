import 'package:flutter/material.dart';
import 'package:app/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // slivers 内部可以使用 sliver 类型的 widget
        slivers: <Widget>[
          SliverAppBar(
            // title: Text("Ning Hao"),
            // pinned 将 SliverAppBar 固定在顶部，不会有动画效果
            // pinned: true,
            // floating 让 SliverAppBar 中的工具栏也随之滚动
            floating: true,
            // expandedHeight 设置伸展高度
            expandedHeight: 178.0,
            // flexibleSpace 将伸展高度变成弹性的空间
            flexibleSpace: FlexibleSpaceBar(
              // 有渐变的效果，可以将外层的 title 去掉
              title: Text(
                'ninghao flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.net/images/overkill.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverSafeArea 让内容显示在安全的区域内
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      // 用于构建列表视图中的项目
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            // Material 小部件主要负责裁剪成由 shape、type 和 borderRadius 指定的形状
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              // elevation 设置阴影
              elevation: 14.0,
              // shadowColor 设置阴影颜色
              shadowColor: Colors.grey.withOpacity(0.5),
              // AspectRatio 设置特定比例的项目
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      // 用于构建网格视图中的项目
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imgUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
      // 构建网格视图相关的东西
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        // childAspectRatio 控制网格视图显示图像的比例
        childAspectRatio: 1.0,
      ),
    );
  }
}
