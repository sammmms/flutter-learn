import 'package:flutter/material.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/page/profile_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSelection currentTheme = context.watch<DarkModeProvider>().theme;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Humble Dog Sam's Application"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfileDetail()));
                },
                child: CircleAvatar(
                  foregroundImage: AssetImage(
                      "assets/${Provider.of<CurrentUser>(context).profile?.pictureLink ?? ""}"),
                ),
              ),
            )
          ],
        ),
        backgroundColor: currentTheme == ThemeSelection.light
            ? const Color.fromARGB(255, 236, 236, 236)
            : const Color.fromARGB(136, 26, 26, 26),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: currentTheme == ThemeSelection.light
                        ? Colors.white
                        : const Color.fromARGB(189, 24, 24, 24)),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SizedBox(
                        width: 400,
                        child: Column(children: [
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset("assets/Post.jpeg")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Beautiful scenery of mountain and river."),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileDetail()));
                                },
                                child: const CircleAvatar(
                                  foregroundImage:
                                      AssetImage("assets/Profile.jpeg"),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<CurrentUser>(context)
                                            .profile!
                                            .username,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text("6 Mar 2024 19:20")
                                    ],
                                  ),
                                  const Row(
                                    children: [Text("3k"), Icon(Icons.comment)],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        "19.8k",
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.redAccent,
                                      )
                                    ],
                                  )
                                ],
                              ))
                            ],
                          )
                        ])))),
          )),
        ),
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
