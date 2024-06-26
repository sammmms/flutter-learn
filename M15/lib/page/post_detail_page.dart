import 'package:flutter/material.dart';
import 'package:m02_praktek/component/my_post.dart';
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
  final bool isOwner;
  const PostDetail({super.key, this.currentProfile, this.isOwner = false});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late User profile;
  late ThemeSelection currentTheme;
  final postController = BehaviorSubject<List<Post>>.seeded([]);

  @override
  void initState() {
    profile = widget.currentProfile != null
        ? widget.currentProfile!
        : context.read<CurrentUser>().profile!;
    postController.add(profile.postList);
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
    profile = widget.currentProfile != null
        ? context
            .watch<UserProvider>()
            .listProfile
            .firstWhere((eachUser) => eachUser == widget.currentProfile)
        : context.watch<CurrentUser>().profile!;
    List<Post> postList = profile.postList
        .where(
          (element) => element.isScheduled == false,
        )
        .toList();
    postController.add(widget.isOwner ? profile.postList : postList);
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
                    return MyPost(profile: profile, post: post);
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
