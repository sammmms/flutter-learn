import 'package:m02_praktek/models/post_model.dart';

class User {
  String username;
  String nama;
  String pictureLink;
  int post;
  int following;
  int follower;
  String description;
  String password;
  List<Post> postList;
  Map userSetting = {"privacy": "public", "notifications": "important"};

  User(
      {required this.userSetting,
      required this.pictureLink,
      required this.username,
      required this.nama,
      required this.post,
      required this.following,
      required this.follower,
      required this.description,
      required this.postList,
      required this.password});
}
