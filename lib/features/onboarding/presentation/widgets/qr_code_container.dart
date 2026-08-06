import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'qrcode/painters/qr_pattern_painter.dart';

class QrCodeContainer extends StatelessWidget {
  const QrCodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 72.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFECEEFE),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: CustomPaint(
        painter: QrPatternPainter(color: const Color(0xFF4342E6)),
      ),

      // If you prefer the Material icon instead of the custom painter,
      // replace the CustomPaint above with:
      //
      // child: Icon(
      //   Icons.qr_code_scanner_rounded,
      //   size: 40.sp,
      //   color: const Color(0xFF4342E6),
      // ),
    );
  }
}
