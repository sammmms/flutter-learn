import 'package:m02_praktek/models/comment_model.dart';

class Post {
  String title;
  String description;
  String link;
  String currentLike;
  String currentComment;
  List<Comments>? commentList;

  Post(
      {required this.title,
      required this.description,
      required this.link,
      this.currentLike = "0",
      this.currentComment = "0",
      this.commentList});
}
