import 'package:flutter/material.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/page/post_detail_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/page/settings_page.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(Icons.more_vert),
                ))
          ],
          title: Text(
              "@${Provider.of<CurrentUser>(context).profile!.username.toString()}"),
        ),
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        foregroundImage: AssetImage(
                            "assets/${Provider.of<CurrentUser>(context).profile!.pictureLink}"),
                        radius: 40),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                                Provider.of<CurrentUser>(context)
                                    .profile!
                                    .post
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const Text("Post")
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                                Provider.of<CurrentUser>(context)
                                    .profile!
                                    .following
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const Text("Following")
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                                Provider.of<CurrentUser>(context)
                                    .profile!
                                    .follower
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const Text("Follower")
                          ],
                        )
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Provider.of<CurrentUser>(context).profile!.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(Provider.of<CurrentUser>(context).profile!.description),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Posts",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Flexible(
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount:
                            Provider.of<CurrentUser>(context).profile!.post,
                        itemBuilder: (BuildContext context, int i) {
                          return InkWell(
                              onTap: () => {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PostDetail()))
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
                        }))
              ],
            )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddPostPage()));
            },
            child: const Icon(Icons.add)));
  }
}
