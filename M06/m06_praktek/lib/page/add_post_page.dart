import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController link = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Post"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: title,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text("Caption"),
                      labelStyle: TextStyle(color: Colors.black54))),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: description,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text("Description"),
                      labelStyle: TextStyle(color: Colors.black54))),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: link,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      label: Text("Image url"),
                      labelStyle: TextStyle(color: Colors.black54))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false).addPost(
                        Post(
                            title: title.text,
                            description: description.text,
                            link: link.text),
                        Provider.of<CurrentUser>(context, listen: false)
                            .profile!);
                    Navigator.of(context).pop();
                  },
                  style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(400, 50)),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent)),
                  child: const Text("Add Post"))
            ],
          ),
        ));
  }
}
