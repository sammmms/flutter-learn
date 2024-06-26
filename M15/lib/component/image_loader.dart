import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';

class ImageLoader extends StatelessWidget {
  final double? size;
  final Post post;
  const ImageLoader({super.key, required this.post, this.size});

  @override
  Widget build(BuildContext context) {
    if (post.imageType == ImageType.network) {
      return AspectRatio(
        aspectRatio: 1,
        child: FadeInImage(
          image: NetworkImage(post.link!),
          placeholder: const AssetImage("assets/placeholder.jpg"),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/placeholder.jpg',
              fit: BoxFit.cover,
            );
          },
          fit: BoxFit.cover,
          width: size ?? 300,
        ),
      );
    } else if (post.imageType == ImageType.asset) {
      return AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          post.link!,
          fit: BoxFit.cover,
          width: size ?? 300,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 1,
        child: Image.file(
          post.image!,
          fit: BoxFit.cover,
          width: size ?? 300,
        ),
      );
    }
  }
}
