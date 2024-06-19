import 'package:m02_praktek/models/comment_model.dart';

class Post {
  String title;
  String link;
  String currentLike;
  List<Comments>? commentList;
  bool isScheduled;

  Post(
      {required this.title,
      required this.link,
      this.currentLike = "0",
      this.commentList,
      this.isScheduled = false});

  void addComment(Comments comment) {
    commentList!.add(comment);
  }
}
