import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class PrivacyButton extends StatelessWidget {
  final String title;
  final String description;
  const PrivacyButton(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            foregroundColor: const MaterialStatePropertyAll(Color(0xAA1B1446)),
            side: MaterialStatePropertyAll(
                BorderSide(color: Colors.grey.shade300, width: 1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.getString(context),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 20, 70)),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(description.getString(context)))
                ],
              ),
              const Icon(Icons.arrow_forward_ios, color: Color(0xFFF5D161))
            ],
          ),
        ));
  }
}
