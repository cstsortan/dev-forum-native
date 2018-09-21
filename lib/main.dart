import 'package:dev_forum_native/models/post.dart';
import 'package:dev_forum_native/posts_service.dart';
import 'package:dev_forum_native/widgets/auth_page.dart';
import 'package:dev_forum_native/widgets/nav_bar.dart';
import 'package:dev_forum_native/widgets/post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyApp());
}

final http.Client client = new http.Client();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(),
      home: new MyHomePage(title: 'Dev Forum'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> _posts = [];

  @override
  initState() {
    getPosts(new http.Client()).then((posts) {
      setState(() {
        _posts = posts;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: Center(child: Text('Login or Register')),
                onTap: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new AuthPage();
                  }));
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              NavBar(),
              Container(
                height: 1.0,
                color: Color(0xFFEEEDEC),
              ),
              Expanded(
                child: FutureBuilder(
                  future: getPosts(client),
                  builder: (_, snap) => snap != null
                      ? ListView.builder(
                          itemCount: _posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            Post post = _posts[index];
                            return PostItem(post: post);
                          },
                        )
                      : CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
