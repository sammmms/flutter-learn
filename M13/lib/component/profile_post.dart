import 'package:flutter/material.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/post_detail_page.dart';

class ProfilePostGrid extends StatelessWidget {
  final User? user;
  const ProfilePostGrid({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: user?.post ?? 0,
        itemBuilder: (BuildContext context, int i) {
          Post post = user!.postList[i];
          return InkWell(
              onTap: () => {
                    Navigator.of(context).push(slideInFromRight(PostDetail(
                      currentProfile: user,
                    )))
                  },
              child: SizedBox(
                width: 100,
                height: 100,
                child: FadeInImage(
                  image: NetworkImage(post.link),
                  placeholder: const AssetImage("assets/placeholder.jpg"),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/placeholder.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ));
        });
  }
}