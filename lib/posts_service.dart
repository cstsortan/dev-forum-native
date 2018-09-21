import 'dart:async';
import 'dart:convert';

import 'package:dev_forum_native/models/post.dart';
import 'package:dev_forum_native/models/tag.dart';
import 'package:http/http.dart';

Future<List<Post>> getPosts(Client http) async {
  var response =
      await http.get('https://dev-forum-45f8b.firebaseapp.com/api/posts');
  List<dynamic> map = json.decode(response.body);
  return map.map((e) => Post.fromJson(e)).toList();
}

Future<List<Tag>> getTags(Client http) async {
  var response =
      await http.get('https://dev-forum-45f8b.firebaseapp.com/api/tags');
  List<dynamic> map = json.decode(response.body);
  return map.map((e) => Tag.fromJson(e)).toList();
}
