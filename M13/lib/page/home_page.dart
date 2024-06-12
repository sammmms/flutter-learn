import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:m02_praktek/component/comment.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/shuffle_loading.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postController = BehaviorSubject<List<Map<User, Post>>>.seeded([]);

  @override
  void initState() {
    List<User> profiles = context.read<UserProvider>().listProfile;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      List<Map<User, Post>> posts = [];
      for (var profile in profiles) {
        List<Post> postList = profile.postList;
        for (var post in postList) {
          posts.add({profile: post});
        }
      }
      posts.shuffle();
      await Future.delayed(const Duration(seconds: 2));
      postController.add(posts);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeSelection currentTheme = context.read<DarkModeProvider>().theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Humble Dog Sam's Application"),
        centerTitle: true,
      ),
      body: OuterConstraint(
        child: StreamBuilder<List<Map<User, Post>>>(
            stream: postController,
            initialData: const [],
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: ShuffleLoading(),
                );
              }
              List<Map<User, Post>> posts = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  postController.add([]);
                  List<User> profiles =
                      context.read<UserProvider>().listProfile;
                  List<Map<User, Post>> posts = [];
                  for (var profile in profiles) {
                    List<Post> postList = profile.postList;
                    for (var post in postList) {
                      posts.add({profile: post});
                    }
                  }
                  posts.shuffle();
                  await Future.delayed(const Duration(seconds: 2));
                  postController.add(posts);
                },
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (builder, index) {
                      User profile = posts[index].keys.first;
                      Post post = posts[index].values.first;
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
                                    image: NetworkImage(post.link),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          post: post,
                                          postController: postController,
                                          posts: posts,
                                        ),
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
                                            width: 30,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.favorite_outline,
                                              ),
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
                    }),
              );
            }),
      ),
    );
  }
}
