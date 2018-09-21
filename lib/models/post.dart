import 'package:dev_forum_native/models/app_user.dart';
import 'package:dev_forum_native/models/tag.dart';

class Post {
  final String text;
  final String timestamp;
  final String title;
  final String id;
  final int responses;
  final AppUser author;
  final Tag tag;

  Post(
      {this.text,
      this.timestamp,
      this.title,
      this.id,
      this.responses,
      this.author,
      this.tag});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      text: json['text'],
      title: json['title'],
      timestamp: json['timestamp'],
      id: json['id'],
      responses: json['responses'],
      author: AppUser.fromJson(json['author']),
      tag: Tag.fromJson(json['tag']),
    );
  }
}
