import 'package:m02_praktek/models/user_model.dart';

class Comments {
  final User user;
  final String content;
  final int like;
  final DateTime time;

  Comments(
      {required this.user,
      required this.content,
      required this.like,
      required this.time});
}
