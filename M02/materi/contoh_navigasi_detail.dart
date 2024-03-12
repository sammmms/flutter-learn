import 'package:flutter/material.dart';
import 'package:teori/m01/data.dart';
import 'package:teori/m02/contoh_data.dart';

class CthNavDetail extends StatelessWidget {
  final Pic g;
  const CthNavDetail({super.key, required this.g});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh Navigasi Detail")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: g.judul,
              child: Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/${g.fileName}"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(g.judul, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(g.desc, style: TextStyle(fontSize: 15))
          ],
        ),
      ),
    );
  }
}
