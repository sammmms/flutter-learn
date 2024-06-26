import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:m02_praktek/component/my_post.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/shuffle_loading.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/profile_page.dart';
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
  late List<User> profileList;

  @override
  void initState() {
    profileList = context.read<UserProvider>().listProfile;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _shufflePost();
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
        child: Column(
          children: [
            _showStories(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
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
                        onRefresh: () async => _shufflePost(),
                        child: _showPost(posts, currentTheme));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showStories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (User user in profileList) ...[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, slideInFromRight(ProfilePage(profile: user)));
              },
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff1f005c),
                            const Color(0xff5b0060),
                            const Color(0xff870160),
                            const Color(0xffac255e),
                            const Color(0xffca485c),
                            const Color(0xffe16b5c),
                            const Color(0xfff39060),
                            const Color(0xffffb56b),
                          ].map((e) => e.withOpacity(0.6)).toList(),
                        )),
                    padding: const EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage(
                        image: NetworkImage(user.pictureLink),
                        placeholder: const AssetImage("assets/placeholder.jpg"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                            ),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(user.username),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ]
        ],
      ),
    );
  }

  Widget _showPost(List<Map<User, Post>> posts, ThemeSelection currentTheme) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (builder, index) {
          Post post = posts[index].values.first;
          return MyPost(post: post);
        });
  }

  void _shufflePost() async {
    List<Map<User, Post>> posts = [];
    for (var profile in profileList) {
      List<Post> postList = profile.postList;
      for (var post in postList) {
        if (post.isScheduled) {
          continue;
        }
        posts.add({profile: post});
      }
    }
    posts.shuffle();
    await Future.delayed(const Duration(seconds: 2));
    postController.add(posts);
  }
}
