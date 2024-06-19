import 'package:flutter/material.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
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
          mustCenter: true,
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
                              Post newPost = _savePost();
                              _formKey.currentState!.reset();
                              _showUndoScaffold(newPost);
                            },
                            child: const Text("Add Post")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context)
                                            .colorScheme
                                            .primaryContainer),
                                    side: MaterialStatePropertyAll(BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary))),
                            onPressed: _schedulePost,
                            child: Text(
                              "Schedule Post",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            )),
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
            textColor: Theme.of(context).colorScheme.onBackground,
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).undoAddPost(
                  newPost,
                  Provider.of<CurrentUser>(context, listen: false).profile!);
            }),
      ),
    );
  }

  Post _savePost({bool isScheduled = false, Duration? duration}) {
    String scheduledImage =
        "https://static.vecteezy.com/system/resources/previews/016/017/383/original/transparent-schedule-icon-free-png.png";

    Post post = Post(
        title: title.text,
        link: isScheduled ? scheduledImage : link.text,
        isScheduled: true);
    User user = Provider.of<CurrentUser>(context, listen: false).profile!;

    Provider.of<UserProvider>(context, listen: false).addPost(post, user);

    if (isScheduled) {
      Post newPost = Post(title: title.text, link: link.text);

      Provider.of<UserProvider>(context, listen: false).schedulePost(user,
          post: post, newPost: newPost, duration: duration!);
    }
    return post;
  }

  void _schedulePost() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (selectedDate == null) {
      return;
    }

    if (!mounted) return;

    TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (selectedTime == null) {
      return;
    }

    DateTime scheduledDate = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedTime.hour, selectedTime.minute);

    Duration duration = scheduledDate.difference(DateTime.now());

    Post newPost = _savePost(
      isScheduled: true,
      duration: Duration(seconds: duration.inSeconds),
    );

    _formKey.currentState?.reset();

    _showUndoScaffold(newPost);
  }
}
