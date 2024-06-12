import 'package:flutter/material.dart';
import 'package:m02_praktek/component/comment.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PostDetail extends StatefulWidget {
  final User? currentProfile;
  const PostDetail({super.key, this.currentProfile});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late User profile;
  late ThemeSelection currentTheme;
  late BehaviorSubject<List<Post>> postController;

  @override
  void initState() {
    profile = widget.currentProfile != null
        ? widget.currentProfile!
        : context.read<CurrentUser>().profile!;
    postController = BehaviorSubject.seeded(profile.postList);
    currentTheme = context.read<DarkModeProvider>().theme;
    super.initState();
  }

  @override
  void dispose() {
    postController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: OuterConstraint(
        child: StreamBuilder<List<Post>>(
            stream: postController,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              List<Post> posts = snapshot.data!;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (builder, index) {
                    Post post = posts[index];
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
                                child: FadeInImage(
                                  image: NetworkImage(posts[index].link),
                                  placeholder: const AssetImage(
                                      "assets/placeholder.jpg"),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/placeholder.jpg',
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  height: 300,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(post.description),
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
                                          placeholder: const AssetImage(
                                              "assets/placeholder.jpg"),
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
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
                                      barrierColor: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      builder: (context) => CommentComponent(
                                          user: profile,
                                          post: post,
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
                                            Text(post.commentList?.length
                                                    .toString() ??
                                                "0"),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.favorite,
                                                color: Colors.red),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(post.currentLike),
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
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context).push(slideInFromRight(const AddPostPage()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
