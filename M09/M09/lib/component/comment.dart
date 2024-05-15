import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m02_praktek/models/comment_model.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class CommentComponent extends StatefulWidget {
  final Post post;
  const CommentComponent({super.key, required this.post});

  @override
  State<CommentComponent> createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  final commentController = StreamController<List<Comments>>();
  final textFieldController = TextEditingController();
  late User currentProfile;

  @override
  void initState() {
    currentProfile = context.read<CurrentUser>().profile!;
    super.initState();
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
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                Divider(
                  thickness: 0.5,
                ),
                Flexible(
                  child: SizedBox(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        Comments item = snapshot.data![index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/${item.user.pictureLink}"),
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
                                Icon(Icons.favorite_outline_rounded),
                                Text(item.like.toString())
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/${currentProfile.pictureLink}"),
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
                                      child: const Icon(
                                          Icons.sticky_note_2_outlined),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        widget.post.commentList ??= [];
                                        widget.post.commentList!.add(Comments(
                                            user: currentProfile,
                                            content: textFieldController.text,
                                            time: DateTime.now(),
                                            like: 0));
                                        commentController
                                            .add(widget.post.commentList!);
                                        textFieldController.clear();
                                      },
                                      child: const Icon(IconData(0xf733,
                                          fontFamily: CupertinoIcons.iconFont,
                                          fontPackage:
                                              CupertinoIcons.iconFontPackage)),
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
