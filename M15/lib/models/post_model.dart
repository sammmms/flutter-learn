import 'dart:io';

import 'package:m02_praktek/models/comment_model.dart';

enum ImageType { network, asset, file }

class Post {
  String title;
  String? link;
  File? image;
  String currentLike;
  List<Comments>? commentList;
  bool isScheduled;
  ImageType imageType;

  Post(
      {required this.title,
      this.link,
      this.currentLike = "0",
      this.commentList,
      this.isScheduled = false,
      this.image,
      this.imageType = ImageType.network});

  void addComment(Comments comment) {
    commentList!.add(comment);
  }
}
