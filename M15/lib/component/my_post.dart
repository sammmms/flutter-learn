import 'package:flutter/material.dart';
import 'package:m02_praktek/component/comment.dart';
import 'package:m02_praktek/component/image_loader.dart';
import 'package:m02_praktek/data/data_dummy.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class MyPost extends StatefulWidget {
  final Post post;
  const MyPost({super.key, required this.post});

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  final postController = BehaviorSubject<List<Post>>.seeded([]);
  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<DarkModeProvider>().theme;
    return Card(
      color: currentTheme == ThemeSelection.light
          ? Colors.white
          : Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageLoader(
                post: widget.post,
                size: double.infinity,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          image: NetworkImage(
                            profile.pictureLink,
                          ),
                          placeholder:
                              const AssetImage("assets/placeholder.jpg"),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.person);
                          },
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [Text(profile.username)],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      enableDrag: true,
                      isScrollControlled: true,
                      scrollControlDisabledMaxHeightRatio: 1,
                      barrierColor:
                          Theme.of(context).textTheme.bodyLarge!.color,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      builder: (context) => CommentComponent(
                          user: profile,
                          post: widget.post,
                          controller: postController),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.comment),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(widget.post.commentList?.length.toString() ??
                                "0"),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite, color: Colors.red),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(widget.post.currentLike),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
