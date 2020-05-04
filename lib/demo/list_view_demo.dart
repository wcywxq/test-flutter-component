import 'package:flutter/material.dart';
import 'package:app/model/post.dart';
import 'package:app/demo/post_show.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  posts[index].imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subhead,
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
          // Positioned.fill 设置的子部件不过不单独设置位置，默认为 0.0
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              // InkWell 带有溅墨效果的区域
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  // debugPrint('tap');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PostShow(post: posts[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
