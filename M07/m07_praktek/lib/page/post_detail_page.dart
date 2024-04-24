import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    User profile = context.read<CurrentUser>().profile!;
    List<Post> posts = profile.postList;
    ThemeSelection currentTheme = context.read<DarkModeProvider>().theme;
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (builder, index) {
              Post post = posts[index];
              return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: currentTheme == ThemeSelection.light
                        ? Colors.white
                        : const Color.fromARGB(189, 24, 24, 24),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          image: NetworkImage(posts[index].link),
                          placeholder:
                              AssetImage('assets/${posts[index].link}'),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/${posts[index].link}',
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            );
                          },
                          width: 300,
                          height: 300,
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
                                    return Image.asset(
                                      'assets/${profile.pictureLink}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    );
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
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.comment),
                                Text(post.currentComment),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.favorite, color: Colors.red),
                                Text(post.currentLike),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddPostPage()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
