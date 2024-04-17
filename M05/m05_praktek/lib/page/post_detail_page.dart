import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    User profile = context.read<CurrentUser>().profile!;
    List<Post> posts = profile.postList;
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (builder, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset("assets/${posts[index].link}"),
                  )
                ],
              ),
            );
          }),
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
