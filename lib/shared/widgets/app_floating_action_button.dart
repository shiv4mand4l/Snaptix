import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.backgroundColor = AppColors.accentDark,
    this.iconColor = AppColors.surface,
    this.elevation = 4,
    this.heroTag,
    this.tooltip,
    this.fabSize,
    this.iconSize,
    this.isMini = false,
  });

  final VoidCallback onPressed;

  final IconData icon;

  final Color backgroundColor;

  final Color iconColor;

  final double elevation;

  final Object? heroTag;

  final String? tooltip;

  /// Custom FAB size
  final double? fabSize;

  /// Custom icon size
  final double? iconSize;

  /// Mini FAB
  final bool isMini;

  @override
  Widget build(BuildContext context) {
    final double buttonSize = fabSize ?? (isMini ? 40.w : 56.w);

    final double iconDimension = iconSize ?? (buttonSize * 0.45);

    return SizedBox(
      width: buttonSize,
      height: buttonSize,

      child: FloatingActionButton(
        heroTag: heroTag,
        tooltip: tooltip,

        onPressed: onPressed,

        backgroundColor: backgroundColor,

        elevation: elevation.h,

        mini: isMini,

        shape: const CircleBorder(),

        child: Icon(icon, color: iconColor, size: iconDimension.sp),
      ),
    );
  }
}
