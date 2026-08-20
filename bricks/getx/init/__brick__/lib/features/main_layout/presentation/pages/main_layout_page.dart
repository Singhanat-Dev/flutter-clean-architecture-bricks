import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_layout_controller.dart';
import '../widgets/blur_overlay.dart';
import '../widgets/main_layout_widget.dart';

class MainLayoutPage extends GetView<MainLayoutController> {
  final Widget child;

  const MainLayoutPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainLayoutWidget(child: child),
          Obx(() => BlurOverlay(isBlur: controller.isBlur.value)),
        ],
      ),
    );
  }
}
