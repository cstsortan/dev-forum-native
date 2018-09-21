import 'package:dev_forum_native/models/post.dart';
import 'package:dev_forum_native/utils/hex_to_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: post.author.profilePhotoUrl != null
                ? NetworkImage(post.author.profilePhotoUrl ?? '')
                : null,
            child: post.author.profilePhotoUrl == null
                ? new Container(
                    child: new Center(
                      child: Text(post.author.name[0]),
                    ),
                  )
                : null,
          ),
          Expanded(
            flex: 1,
            child: new Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Chip(
                      backgroundColor: hexToColor(post.tag.color),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 2.0,
                      ),
                      label: Text(
                        post.tag.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(4.0),
            color: new Color(0xFFEEEDEC),
            child: new Container(
              child: Text(
                "${post.responses ?? 0}",
                style: TextStyle(
                  color: Color(0xFF85817A),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
