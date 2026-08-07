import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

class TicketDashedDivider extends StatelessWidget {
  final Color backgroundColor;
  final Color lineDashColor;

  const TicketDashedDivider({
    super.key,
    this.backgroundColor = AppColors.disabled,
    this.lineDashColor = const Color(0xD6E2E4EB),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomPaint(
            size: Size(double.infinity, 1.h),
            painter: _DashedLinePainter(color: lineDashColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 10.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(10.r),
                ),
              ),
            ),
            Container(
              width: 10.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10.r),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.w;
    double dashSpace = 4.w;
    double startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.h;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
