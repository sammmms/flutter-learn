import 'package:flutter/material.dart';
import 'package:m02_praktek/page/post_detail_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class ProfilePost extends StatelessWidget {
  const ProfilePost({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<CurrentUser>(context).profile;
    return Flexible(
        child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: profile?.post ?? 0,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                  onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PostDetail()))
                      },
                  child: Hero(
                      tag: Provider.of<CurrentUser>(context)
                          .profile!
                          .postList[i]
                          .title,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/${Provider.of<CurrentUser>(context).profile!.postList[i].link}"),
                              fit: BoxFit.cover),
                        ),
                        width: 100,
                        height: 100,
                      )));
            }));
  }
}
