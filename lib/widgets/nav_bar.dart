import 'package:dev_forum_native/widgets/tags_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 47.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
            child: new Icon(
              FontAwesomeIcons.bars,
              color: CupertinoColors.inactiveGray,
              size: 20.0,
            ),
            padding: EdgeInsets.all(3.0),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          CupertinoButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'All Discussions',
                  style: TextStyle(
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
                Icon(
                  FontAwesomeIcons.sort,
                  size: 15.0,
                  color: CupertinoColors.activeBlue,
                )
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                builder: (BuildContext context) {
                  return new BottomSheet(
                    builder: (BuildContext context) {
                      return TagsList();
                    },
                    onClosing: () {},
                  );
                },
                context: context,
              );
            },
          ),
          CupertinoButton(
            child: new Icon(
              FontAwesomeIcons.edit,
              color: CupertinoColors.inactiveGray,
              size: 20.0,
            ),
            padding: EdgeInsets.all(3.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
