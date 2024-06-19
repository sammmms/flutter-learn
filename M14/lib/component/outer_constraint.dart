import 'package:flutter/material.dart';

class OuterConstraint extends StatelessWidget {
  final Widget child;
  final bool mustCenter;
  const OuterConstraint(
      {super.key, required this.child, this.mustCenter = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.95,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Align(
          alignment: mustCenter
              ? AlignmentDirectional.center
              : AlignmentDirectional.topCenter,
          child: SizedBox(
            width: 500,
            child: child,
          ),
        ),
      ),
    );
  }
}
