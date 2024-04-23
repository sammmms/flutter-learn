import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class TextNavigator extends StatelessWidget {
  final Function onTapFunction;
  final String text;
  final TextStyle? style;
  const TextNavigator(
      {super.key, required this.onTapFunction, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text.getString(context),
              style: style,
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
