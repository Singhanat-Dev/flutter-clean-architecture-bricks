import 'package:flutter/material.dart';

class MainLayoutWidget extends StatelessWidget {
  final Widget child;

  const MainLayoutWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}
