import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class TicketCutoutDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const TicketCutoutDivider({
    super.key,
    this.height = 1,
    this.color = AppColors.surface,
    this.dashWidth = 5,
    this.dashSpace = 5,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width <= 0) {
          return const SizedBox.shrink();
        }

        final count = (width / (dashWidth + dashSpace)).floor().clamp(1, 100);

        return SizedBox(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              count,
              (_) => SizedBox(
                width: dashWidth,
                height: height,
                child: DecoratedBox(decoration: BoxDecoration(color: color)),
              ),
            ),
          ),
        );
      },
    );
  }
}
