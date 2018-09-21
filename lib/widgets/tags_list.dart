import 'package:dev_forum_native/main.dart';
import 'package:dev_forum_native/models/tag.dart';
import 'package:dev_forum_native/posts_service.dart';
import 'package:dev_forum_native/utils/hex_to_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TagsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getTags(client),
      builder: (BuildContext context, AsyncSnapshot<List<Tag>> snapshot) {
        List<Tag> tags = snapshot.data ?? [];
        if (snapshot.hasData) {
          final List<Widget> widgets = [];
          widgets.addAll([
            new ListTile(
              leading: Icon(FontAwesomeIcons.comments),
              title: Text('All Discussions'),
            ),
            new ListTile(
              leading: Icon(FontAwesomeIcons.thLarge),
              title: Text('Tags'),
            ),
          ]);
          widgets.addAll(tags.map((tag) => new ListTile(
                title: Text(tag.name),
                leading: new Material(
                  color: hexToColor(tag.color),
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    height: 15.0,
                    width: 25.0,
                  ),
                ),
              )));
          return new ListView(
            children: widgets,
          );
        } else {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
