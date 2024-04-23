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
      backgroundColor: currentTheme == ThemeSelection.light
          ? const Color.fromARGB(255, 236, 236, 236)
          : const Color.fromARGB(136, 26, 26, 26),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (builder, index) {
              Post post = posts[index];
              return Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 20),
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
                        child: Image.asset(
                          "assets/${post.link}",
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/${profile.pictureLink}'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.title),
                              Text(post.description),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.comment),
                            Text(post.currentComment),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red),
                            Text(post.currentLike),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddPostPage()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
