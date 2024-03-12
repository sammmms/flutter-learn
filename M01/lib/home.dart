import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Samuel's Social App")),
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
                            child: Image.asset("src/Post.jpeg")),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Beautiful scenery of mountain and river."),
                            )),
                        GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            const children: [
                              Text("Hi"),
                              Text("Halo"),
                              Text("Hi lagi"),
                              Text("Halo lagi")
                            ])
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

