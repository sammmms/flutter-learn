import 'package:flutter/material.dart';
import 'package:m02_praktek/post_detail.dart';
import "data_dummy.dart";

class ProfileDetail extends StatelessWidget {
  final Profile p;
  const ProfileDetail({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.username),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(foregroundImage: AssetImage(p.pictureLink),radius: 40),
                Expanded(
                  flex: 1,
                  child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Text(p.post.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("Post")
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Text(p.following.toString(), style:const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("Following")
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Text(p.follower.toString(), style:const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("Follower")
                          ],
                        )
                      ],
                    )
                  )
                
              ],
            ),
            const SizedBox(height: 10,),
            Text(p.nama,style: const TextStyle(fontWeight:  FontWeight.bold),),
            const SizedBox(height: 5,),
            Text(p.description),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1), borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap:()=>{}, child:const Icon(Icons.window_outlined)),
                  InkWell(onTap:()=>{}, child:const Icon(Icons.roller_shades_closed_outlined)),
                  InkWell(onTap:()=>{}, child:const Icon(Icons.person_2_outlined))
                ]
              )),
            ),
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10), 
                itemCount: p.postList.length,
                itemBuilder: (BuildContext context, int i){
                  return InkWell(
                    onTap: ()=>{
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PostDetail(p: p.postList[i]))
                      )
                    },
                    child: Hero(
                    tag: p.postList[i].title,
                    child:Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(p.postList[i].link), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: 100,
                    height: 100,
                  )));
              }))
            
          ],
        )
      )
    );
  }
}
