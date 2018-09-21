class AppUser {
  final String uid;
  final String name;
  final String profilePhotoUrl;

  AppUser({this.uid, this.name, this.profilePhotoUrl});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        uid: json['uid'],
        name: json['name'],
        profilePhotoUrl: json['profilePhotoUrl']);
  }
}
