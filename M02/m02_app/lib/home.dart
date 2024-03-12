import 'package:flutter/material.dart';
import 'dummy_data.dart';
import "picture_detail.dart";

class Home extends StatelessWidget {
  Home({super.key});

  final List<Pic> ls = [p1, p2, p3, p4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Latihan M02")),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: ls.length,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                      onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PictureDetail(p: ls[i])))
                          },
                      child: Hero(
                          tag: ls[i].title,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(ls[i].link),
                                    fit: BoxFit.cover)),
                          )));
                })));
  }
}
