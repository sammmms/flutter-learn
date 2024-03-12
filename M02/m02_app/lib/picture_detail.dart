import 'package:flutter/material.dart';
import "dummy_data.dart";

class PictureDetail extends StatelessWidget {
  final Pic p;
  const PictureDetail({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail ${p.title}")),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(20),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: p.title,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/${p.link}"),
                                fit: BoxFit.cover)),
                        width: 400,
                        height: 400)),
                const SizedBox(height: 10),
                Text(
                  p.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(p.description)
              ],
            ))));
  }
}
