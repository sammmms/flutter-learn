import 'package:flutter/material.dart';
import 'package:m02_praktek/addPost.dart';
import 'package:m02_praktek/profile_detail.dart';
import 'package:m02_praktek/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Humble Dog Sam's Application"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileDetail()));
                },
                child: CircleAvatar(
                  foregroundImage: AssetImage(
                      Provider.of<CurrentUser>(context).profile.pictureLink),
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: SizedBox(
                        width: 400,
                        child: Column(children: [
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset("Post.jpeg")),
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
                                      builder: (context) => ProfileDetail()));
                                },
                                child: const CircleAvatar(
                                  foregroundImage: AssetImage("Profile.jpeg"),
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
                                            .profile
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
                  MaterialPageRoute(builder: (context) => const AddPost()));
            },
            child: const Icon(Icons.add)));
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Pengenalan Flutter"),
//           backgroundColor: Colors.teal,
//         ),
//         body: const Center(
//           child: Column(
//             children: [
//               SizedBox(height: 200),
//               Text("Saya mahasiswa IF-B Sore"),
//               Text("NIM  : 221110680"),
//               Text("Nama : Samuel Onasis"),
//               Text("Berhasil menginstall Flutter."),
//             ],
//           ),
//         ));
//   }
// }

