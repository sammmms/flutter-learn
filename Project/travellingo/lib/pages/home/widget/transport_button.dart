import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class TransportButton extends StatelessWidget {
  final String icon;
  final String label;
  const TransportButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: const Color.fromRGBO(62, 132, 168, 1),
          ),
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(8),
          child: Image.asset(icon),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label.getString(context),
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
