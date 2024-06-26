import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m02_praktek/component/image_loader.dart';
import 'package:m02_praktek/component/image_source_bottomsheet.dart';
import 'package:m02_praktek/component/link_dialog.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PickedImage {
  final File? image;
  final String? link;
  final ImageType imageType;

  PickedImage({this.image, this.link, this.imageType = ImageType.network});
}

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
  late ScaffoldMessengerState scaffoldState;
  final _pickedImage = BehaviorSubject<PickedImage>();
  final _formKey = GlobalKey<FormState>();
  String? link;

  @override
  void initState() {
    title = widget.title ?? TextEditingController();
    description = widget.description ?? TextEditingController();
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
                      StreamBuilder<PickedImage>(
                          stream: _pickedImage,
                          builder: (context, snapshot) {
                            PickedImage? pickedImage = snapshot.data;
                            return GestureDetector(
                              onTap: _pickImage,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Center(
                                        child: pickedImage != null
                                            ? ImageLoader(
                                                post: Post(
                                                    title: title.text,
                                                    link: pickedImage.link,
                                                    image: pickedImage.image,
                                                    imageType:
                                                        pickedImage.imageType),
                                                size: 300)
                                            : const Icon(
                                                Icons.add_a_photo,
                                                size: 50,
                                                color: Colors.grey,
                                              )),
                                  ),
                                ),
                              ),
                            );
                          }),
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              Post? newPost = _savePost();
                              if (newPost != null) {
                                _formKey.currentState!.reset();
                                _showUndoScaffold(newPost);
                              }
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

  Post? _savePost({bool isScheduled = false, Duration? duration}) {
    String scheduledImage =
        "https://static.vecteezy.com/system/resources/previews/016/017/383/original/transparent-schedule-icon-free-png.png";

    if (_pickedImage.valueOrNull == null) {
      return null;
    }

    Post post = Post(
      title: title.text,
      isScheduled: isScheduled,
      link: isScheduled ? scheduledImage : _pickedImage.value.link,
      imageType: _pickedImage.value.imageType,
      image: _pickedImage.value.image,
    );
    User user = Provider.of<CurrentUser>(context, listen: false).profile!;

    Provider.of<UserProvider>(context, listen: false).addPost(post, user);

    if (isScheduled) {
      Post newPost = Post(
          title: title.text,
          isScheduled: false,
          link: _pickedImage.value.link,
          imageType: _pickedImage.value.imageType,
          image: _pickedImage.value.image);

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

    Post? newPost = _savePost(
      isScheduled: true,
      duration: Duration(seconds: duration.inSeconds),
    );

    if (newPost != null) {
      _formKey.currentState?.reset();

      _showUndoScaffold(newPost);
    }
  }

  void _pickImage() async {
    ImageSources? source = await showModalBottomSheet(
        context: context, builder: (context) => const ImageSourceBottomsheet());

    if (source == null) {
      return;
    }

    if (!mounted) return;

    XFile? pickedImage;
    File? image;
    String? link;

    switch (source) {
      case ImageSources.camera:
        pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
        break;
      case ImageSources.gallery:
        pickedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        break;
      case ImageSources.link:
        link = await showDialog(
            context: context, builder: (context) => const AddLinkDialog());
        break;
    }

    if (link == null && pickedImage == null) {
      return;
    }

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }

    final pickedImages = PickedImage(
        image: image,
        link: link,
        imageType: link != null
            ? ImageType.network
            : image != null
                ? ImageType.file
                : ImageType.asset);

    _pickedImage.add(pickedImages);
  }
}
