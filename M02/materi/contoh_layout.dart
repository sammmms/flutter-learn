import 'package:flutter/material.dart';

class CthLayout extends StatelessWidget {
  CthLayout({super.key});

  final List<int> ls = [1,2,3,4,5,6,7,8,9,10,11,20];

  Color retColor(int i){
    if(i%3 == 0){
      return Colors.green;
    }
    else if (i%3 == 1){
      return Colors.redAccent;
    }
    else{
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh Layout")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemCount: ls.length,
          itemBuilder: (BuildContext context, int i){
            return Container(
              color: retColor(ls[i]),
              child: Center(
                child: Text(
                  ls[i].toString(),
                  style: TextStyle(
                    color: ls[i] % 3 == 1 || ls[i] % 3 == 0 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
              ),
            );
          }
        )
      ),
    );
  }
}

Widget cthRow(){
  return Row(
    children: [
      Expanded(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    ],
  );
}