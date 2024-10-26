import 'package:flutter/material.dart';

class DebugWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  const DebugWidget({super.key, required this.child, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}
