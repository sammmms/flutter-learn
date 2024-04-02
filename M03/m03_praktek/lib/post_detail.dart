import 'package:flutter/material.dart';
import "data_dummy.dart";
import "profile_detail.dart";

class PostDetail extends StatelessWidget {
  final Post p;
  const PostDetail({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title)
      ),
      body: Center(
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
                        Hero(
                          tag: p.title,
                          child:ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(p.link))),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  p.description),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ProfileDetail(p: profile))
                              );},
                              child: const CircleAvatar(
                                foregroundImage: AssetImage("Profile.jpeg"),
                              ),),
                            Expanded(
                              child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(profile.username, style: const TextStyle(fontWeight: FontWeight.bold),),
                                    const Text("6 Mar 2024 19:20")
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text("3k"),
                                    Icon(Icons.comment)
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text("19.8k", style: TextStyle(color: Colors.redAccent),),
                                    Icon(Icons.favorite,color: Colors.redAccent,)
                                  ],
                                )
                                  ],
                                ))
                                
                          ],)
                      ])))),
        ))
    );
  }
}