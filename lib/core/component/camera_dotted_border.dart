import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CameraDottedBorder extends StatelessWidget {
  const CameraDottedBorder({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 25,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: DottedBorder(
        color: AppColors.orderNumberColor,
        strokeWidth: 2,
        strokeCap: StrokeCap.round,
        dashPattern: const [3, 10],
        borderType: BorderType.Circle,
        radius: const Radius.circular(8),
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: GestureDetector(
              onTap: onTap,
              child: const Center(
                child: Icon(
                  Icons.linked_camera_outlined,
                  size: 40,
                  color: AppColors.appBarColor,
                ),
              ),
            )),
      ),
    );
  }
}
