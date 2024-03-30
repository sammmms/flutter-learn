import 'package:flutter/material.dart';
import 'package:m02_praktek/profile_detail.dart';
import "data_dummy.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: 
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children: [
              const Text("The Humble Dog Sam's Social Application",overflow: TextOverflow.fade,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileDetail(p: profile))
                  );},
                child: const CircleAvatar(
                  foregroundImage: AssetImage("Profile.jpeg"),
                ),),
            ],)
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
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
                        ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.asset("Post.jpeg")),
                        Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Beautiful scenery of mountain and river."),
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ProfileDetail(p: profile))
                              );},
                              child: const CircleAvatar(
                                foregroundImage: AssetImage("Profile.jpeg"),
                              )
                            ,),
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
        )));
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

