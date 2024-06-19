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

  static create(String username, String password) {
    return User(
        userSetting: {"privacy": "public", "notifications": "important"},
        pictureLink: "",
        username: username,
        nama: username,
        post: 0,
        following: 0,
        follower: 0,
        description: "",
        postList: [],
        password: password);
  }

  static copyWith(
      {Map? userSetting,
      String? pictureLink,
      String? username,
      String? nama,
      int? post,
      int? following,
      int? follower,
      String? description,
      List<Post>? postList,
      String? password}) {
    return User(
        userSetting:
            userSetting ?? {"privacy": "public", "notifications": "important"},
        pictureLink: pictureLink ??
            "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
        username: username ?? "",
        nama: nama ?? "",
        post: post ?? 0,
        following: following ?? 0,
        follower: follower ?? 0,
        description: description ?? "",
        postList: postList ?? [],
        password: password ?? "");
  }
}
