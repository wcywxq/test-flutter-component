import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return RichTextDemo();
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: AssetImage(),
          image: NetworkImage(
            'https://img1.doubanio.com/view/dale-online/dale_ad/public/352cca482b25d39.jpg',
          ),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.noRepeat,
          // 让图像保持比例覆盖整个容器显示
          fit: BoxFit.cover,
          // 设置颜色滤镜
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // 1. 边框
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3.0,
                style: BorderStyle.solid,
              ),
              // border: Border(
              //   top: BorderSide(
              //     color: Colors.indigoAccent[100],
              //     width: 3.0,
              //     style: BorderStyle.solid
              //   ),
              //   bottom: BorderSide(
              //     color: Colors.indigoAccent[100],
              //     width: 3.0,
              //     style: BorderStyle.solid
              //   ),
              // ),
              // 2. 圆角
              borderRadius: BorderRadius.circular(16.0),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(64.0),
              //   bottomLeft: Radius.circular(64.0),
              //   // topLeft: Radius.circular(64.0),
              //   // topLeft: Radius.circular(64.0),
              // ),
              // 3. 阴影
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0.0, 16.0), // 偏移
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 25.0, // 模糊值，越大越明显
                  spreadRadius: -9.0, // 阴影扩散的程度，正数扩大，负数缩小
                ),
              ],
              // 4. 形状
              shape: BoxShape.rectangle, // BoxShape.circle 不能设置圆角效果
              // 5. 渐变效果
              // 5.1 镜像渐变
              // gradient: RadialGradient(
              //   colors: <Color>[
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0),
              //   ],
              // ),
              // 5.2 线性渐变
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'ninghao',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 20.0,
  );

  final String _author = "李白";
  final String _title = "将进酒";

  @override
  Widget build(BuildContext context) {
    return Text(
      '《 $_title 》-- $_author 萨科你是否卡萨诺开发那是看能否卡萨诺开发纳斯卡肌肤那就看上你饭卡淑女风阿法法发送萨科你是否卡萨诺开发那是看能否卡萨诺开发纳斯卡肌肤那就看上你饭卡淑女风阿法法发送萨科你是否卡萨诺开发那是看能否卡萨诺开发纳斯卡肌肤那就看上你饭卡淑女风阿法法发送萨科你是否卡萨诺开发那是看能否卡萨诺开发纳斯卡肌肤那就看上你饭卡淑女风阿法法发送',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
