import 'package:flutter/material.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
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
  late ScaffoldMessengerState scaffoldState;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = widget.title ?? TextEditingController();
    description = widget.description ?? TextEditingController();
    link = widget.link ?? TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scaffoldState.clearSnackBars();
    });
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    scaffoldState = ScaffoldMessenger.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Post"),
        ),
        body: OuterConstraint(
          child: Scrollbar(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Title shouldn't be empty";
                            }
                            return null;
                          },
                          controller: title,
                          decoration: const InputDecoration(
                            label: Text("Caption"),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Description shouldn't be empty";
                          }
                          return null;
                        },
                        controller: description,
                        decoration: const InputDecoration(
                          label: Text("Description"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Image url shouldn't be empty";
                            }
                            return null;
                          },
                          controller: link,
                          decoration: const InputDecoration(
                            label: Text("Image url"),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              Post newPost = Post(
                                  title: title.text,
                                  description: description.text,
                                  link: link.text);
                              Provider.of<UserProvider>(context, listen: false)
                                  .addPost(
                                      newPost,
                                      Provider.of<CurrentUser>(context,
                                              listen: false)
                                          .profile!);
                              _formKey.currentState!.reset();
                              _showUndoScaffold(newPost);
                            },
                            child: const Text("Add Post")),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _showUndoScaffold(Post newPost) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Post berhasil ditambahkan."),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).undoAddPost(
                  newPost,
                  Provider.of<CurrentUser>(context, listen: false).profile!);
            }),
      ),
    );
  }
}
