import 'package:flutter/material.dart';
import 'package:m02_praktek/addPost.dart';
import 'package:m02_praktek/post_detail.dart';
import 'package:m02_praktek/provider.dart';
import 'package:m02_praktek/settings.dart';
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
                      builder: (context) => const Settings()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(Icons.more_vert),
                ))
          ],
          title: Text(
              "@${Provider.of<CurrentUser>(context).profile.username.toString()}"),
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
                            Provider.of<CurrentUser>(context)
                                .profile
                                .pictureLink),
                        radius: 40),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                Text(
                                    Provider.of<CurrentUser>(context)
                                        .profile
                                        .post
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const Text("Post")
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                Text(
                                    Provider.of<CurrentUser>(context)
                                        .profile
                                        .following
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const Text("Following")
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                Text(
                                    Provider.of<CurrentUser>(context)
                                        .profile
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
                  Provider.of<CurrentUser>(context).profile.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(Provider.of<CurrentUser>(context).profile.description),
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
                            Provider.of<CurrentUser>(context).profile.post,
                        itemBuilder: (BuildContext context, int i) {
                          return InkWell(
                              onTap: () => {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => PostDetail()))
                                  },
                              child: Hero(
                                  tag: Provider.of<CurrentUser>(context)
                                      .profile
                                      .postList[i]
                                      .title,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              Provider.of<CurrentUser>(context)
                                                  .profile
                                                  .postList[i]
                                                  .link),
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
                  MaterialPageRoute(builder: (context) => const AddPost()));
            },
            child: const Icon(Icons.add)));
  }
}
