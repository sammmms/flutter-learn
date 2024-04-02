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
      appBar: AppBar(
        title: const Text("Posts")
      ),
      backgroundColor: Colors.black38,
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: Provider.of<CurrentUser>(context).profile.post,
          itemBuilder: (BuildContext context, int i){
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(children: [
                              Hero(
                                tag: Provider.of<CurrentUser>(context).profile.postList[i].title,
                                child: Container(
                                  width: 400,
                                  height: 300,
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(fit: BoxFit.cover,image: AssetImage(Provider.of<CurrentUser>(context).profile.postList[i].link)),
                                  ),
                                )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Provider.of<CurrentUser>(context).profile.postList[i].description),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: (){Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => ProfileDetail())
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
                            ]))));
          }
        )
        ),
      floatingActionButton: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>AddPost())
            );
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical:21))
          ),
          child: Icon(Icons.add, color:Colors.white)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
