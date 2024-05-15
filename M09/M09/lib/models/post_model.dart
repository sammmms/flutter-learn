class Post {
  String title;
  String description;
  String link;
  String currentLike;
  String currentComment;

  Post(
      {required this.title,
      required this.description,
      required this.link,
      this.currentLike = "0",
      this.currentComment = "0"});
}
