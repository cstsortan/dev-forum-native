class Tag {
  final String id;
  final String color;
  final String name;
  final String description;

  Tag({this.id, this.color, this.name, this.description});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
        id: json['id'],
        color: json['colour'],
        name: json['name'],
        description: json['description']);
  }
}
