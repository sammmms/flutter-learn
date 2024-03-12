import 'package:flutter/material.dart';
import 'package:teori/m02/contoh_data.dart';
import 'package:teori/m02/contoh_navigasi_detail.dart';

class CthNavigasi extends StatelessWidget {
  const CthNavigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contoh Navigasi"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CthNavDetail(g: p4))
                );
              },
              child: Hero(
                tag: p4.judul,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/${p4.fileName}"),
                  radius: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
