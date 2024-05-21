import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatefulWidget {
  final TextEditingController? title;
  final TextEditingController? description;
  final TextEditingController? link;
  const AddPostPage({
    super.key,
    this.title,
    this.description,
    this.link,
  });

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController link;

  @override
  void initState() {
    title = widget.title ?? TextEditingController();
    description = widget.description ?? TextEditingController();
    link = widget.link ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    label: Text("Caption"),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: description,
                decoration: const InputDecoration(
                  label: Text("Description"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: link,
                  decoration: const InputDecoration(
                    label: Text("Image url"),
                  )),
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
                    title.text = "";
                    description.text = "";
                    link.text = "";
                  },
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(400, 50)),
                  ),
                  child: const Text("Add Post"))
            ],
          ),
        ));
  }
}
