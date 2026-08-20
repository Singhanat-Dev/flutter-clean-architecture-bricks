import 'dart:ui';
import 'package:flutter/material.dart';

class BlurOverlay extends StatelessWidget {
  final bool isBlur;

  const BlurOverlay({
    super.key,
    required this.isBlur,
  });

  @override
  Widget build(BuildContext context) {
    if (!isBlur) return const SizedBox.shrink();

    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
