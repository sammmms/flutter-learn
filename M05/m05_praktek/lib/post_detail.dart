import 'package:flutter/material.dart';
import 'package:m02_praktek/addPost.dart';
import 'package:m02_praktek/profile_detail.dart';
import 'package:m02_praktek/provider.dart';
import 'package:provider/provider.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: Provider.of<CurrentUser>(context, listen: false)
              .profile
              .postList
              .map<Widget>(
                (items) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: 500,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      SizedBox(
                        width: 480,
                        height: 400,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              items.link,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  Provider.of<CurrentUser>(context,
                                          listen: false)
                                      .profile
                                      .pictureLink),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items.title),
                                  Text(items.description),
                                ]),
                            Row(children: [
                              const Icon(Icons.favorite, color: Colors.red),
                              Text(items.currentLike)
                            ]),
                            Row(children: [
                              const Icon(Icons.comment),
                              Text(items.currentComment)
                            ]),
                          ])
                    ])),
              )
              .toList(),
        )),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddPost()));
          },
          child: const Icon(Icons.add)),
    );
  }
}


// GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1),
//               itemCount: Provider.of<CurrentUser>(context).profile.post,
//               itemBuilder: (BuildContext context, int i) {
//                 return Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Center(
//                       child: SizedBox(
//                     width: 500,
//                     height: 600,
//                     child: Container(
//                         decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             color: Colors.white),
//                         child: Padding(
//                             padding: const EdgeInsets.all(30),
//                             child: Column(children: [
//                               Hero(
//                                   tag: Provider.of<CurrentUser>(context)
//                                       .profile
//                                       .postList[i]
//                                       .title,
//                                   child: Container(
//                                     width: 400,
//                                     height: 400,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: AssetImage(
//                                               Provider.of<CurrentUser>(context)
//                                                   .profile
//                                                   .postList[i]
//                                                   .link)),
//                                     ),
//                                   )),
//                               Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 20),
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                         Provider.of<CurrentUser>(context)
//                                             .profile
//                                             .postList[i]
//                                             .description),
//                                   )),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   ProfileDetail()));
//                                     },
//                                     child: const CircleAvatar(
//                                       foregroundImage:
//                                           AssetImage("Profile.jpeg"),
//                                     ),
//                                   ),
//                                   Expanded(
//                                       child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             profile.username,
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           const Text("6 Mar 2024 19:20")
//                                         ],
//                                       ),
//                                       const Row(
//                                         children: [
//                                           Text("3k"),
//                                           Icon(Icons.comment)
//                                         ],
//                                       ),
//                                       const Row(
//                                         children: [
//                                           Text(
//                                             "19.8k",
//                                             style: TextStyle(
//                                                 color: Colors.redAccent),
//                                           ),
//                                           Icon(
//                                             Icons.favorite,
//                                             color: Colors.redAccent,
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ))
//                                 ],
//                               )
//                             ]))),
//                   )),
//                 );
//               })