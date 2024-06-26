import 'package:flutter/material.dart';
import 'package:m02_praktek/component/image_loader.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/post_detail_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class ProfilePostGrid extends StatelessWidget {
  final User? user;
  final bool isOwner;
  const ProfilePostGrid({super.key, required this.user, this.isOwner = false});

  @override
  Widget build(BuildContext context) {
    User user = context.watch<UserProvider>().listProfile.firstWhere(
          (eachUser) => eachUser == this.user,
        );
    List<Post> postList =
        user.postList.where((element) => element.isScheduled == false).toList();
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: isOwner ? user.post : postList.length,
        itemBuilder: (BuildContext context, int i) {
          Post post = isOwner ? user.postList[i] : postList[i];
          return InkWell(
              onTap: () => {
                    Navigator.of(context).push(slideInFromRight(PostDetail(
                      currentProfile: user,
                      isOwner: isOwner,
                    )))
                  },
              child: SizedBox(
                  width: 100, height: 100, child: ImageLoader(post: post)));
        });
  }
}
