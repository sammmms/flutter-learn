import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m02_praktek/models/comment_model.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class CommentComponent extends StatefulWidget {
  final Post post;
  final BehaviorSubject<List<Post>>? controller;
  final BehaviorSubject<List<Map<User, Post>>>? postController;
  final List<Map<User, Post>>? posts;
  const CommentComponent(
      {super.key,
      required this.post,
      this.controller,
      this.postController,
      this.posts});

  @override
  State<CommentComponent> createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  final commentController = StreamController<List<Comments>>();
  final textFieldController = TextEditingController();
  late User currentProfile;
  late ThemeSelection currentTheme;

  @override
  void initState() {
    currentProfile = context.read<CurrentUser>().profile!;
    currentTheme = context.read<DarkModeProvider>().theme;
    super.initState();
  }

  @override
  void dispose() {
    commentController.close();
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Comments>>(
      stream: commentController.stream,
      initialData: widget.post.commentList ?? <Comments>[],
      builder: (context, snapshot) {
        return SafeArea(
          bottom: true,
          child: Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Comment",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                ),
                Flexible(
                  child: SizedBox(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        Comments item = snapshot.data![index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FadeInImage(
                                image: NetworkImage(item.user.pictureLink),
                                placeholder:
                                    const AssetImage("assets/placeholder.jpg"),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/placeholder.jpg',
                                    fit: BoxFit.cover,
                                  );
                                },
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            item.user.username,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            item.content,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_outline_rounded),
                                Text(item.like.toString())
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            image: NetworkImage(currentProfile.pictureLink),
                            placeholder:
                                const AssetImage("assets/placeholder.jpg"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/placeholder.jpg',
                                fit: BoxFit.cover,
                              );
                            },
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: textFieldController,
                          decoration: InputDecoration(
                              suffixIcon: textFieldController.text.isEmpty
                                  ? GestureDetector(
                                      child: Icon(Icons.sticky_note_2_outlined,
                                          color: currentTheme ==
                                                  ThemeSelection.light
                                              ? Colors.black
                                              : Colors.white),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        widget.post.commentList ??= [];
                                        final newComment = Comments(
                                            user: currentProfile,
                                            content: textFieldController.text,
                                            time: DateTime.now(),
                                            like: 0);
                                        widget.post.addComment(newComment);
                                        //
                                        widget.controller == null
                                            ? widget.postController!
                                                .add(widget.posts!)
                                            : widget.controller!
                                                .add(currentProfile.postList);
                                        //
                                        commentController
                                            .add(widget.post.commentList!);
                                        textFieldController.clear();
                                      },
                                      child: Icon(
                                          const IconData(0xf733,
                                              fontFamily:
                                                  CupertinoIcons.iconFont,
                                              fontPackage: CupertinoIcons
                                                  .iconFontPackage),
                                          color: currentTheme ==
                                                  ThemeSelection.light
                                              ? Colors.black
                                              : Colors.white),
                                    )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
