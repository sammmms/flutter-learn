import 'package:flutter/material.dart';

enum ImageSources { camera, gallery, link }

class ImageSourceBottomsheet extends StatelessWidget {
  const ImageSourceBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text("Camera"),
          onTap: () => Navigator.of(context).pop(ImageSources.camera),
        ),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text("Gallery"),
          onTap: () => Navigator.of(context).pop(ImageSources.gallery),
        ),
        ListTile(
          leading: const Icon(Icons.link),
          title: const Text("Link"),
          onTap: () => Navigator.of(context).pop(ImageSources.link),
        ),
        ListTile(
          leading: const Icon(Icons.close),
          title: const Text("Cancel"),
          onTap: () => Navigator.of(context).pop(null),
        )
      ],
    );
  }
}
