import 'package:flutter/material.dart';

class OuterConstraint extends StatelessWidget {
  final Widget child;
  const OuterConstraint({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: SizedBox(
            width: 500,
            child: child,
          ),
        ),
      ),
    );
  }
}
