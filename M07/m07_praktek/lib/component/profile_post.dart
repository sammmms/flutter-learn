import 'package:flutter/material.dart';
import 'package:m02_praktek/page/post_detail_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class ProfilePost extends StatelessWidget {
  const ProfilePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: context.read<CurrentUser>().profile?.post ?? 0,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                  onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PostDetail()))
                      },
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: FadeInImage(
                      image: NetworkImage(Provider.of<CurrentUser>(context)
                              .profile
                              ?.postList[i]
                              .link ??
                          ""),
                      placeholder: const AssetImage("assets/placeholder.jpg"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/${Provider.of<CurrentUser>(context).profile?.postList[i].link}',
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ));
            }));
  }
}
