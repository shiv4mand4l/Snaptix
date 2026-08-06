import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';

class EventLocationSection extends StatelessWidget {
  final String venueName;
  final String address;
  final VoidCallback onDirectionsTap;

  const EventLocationSection({
    super.key,
    required this.venueName,
    required this.address,
    required this.onDirectionsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-------------------------------------
        // Title
        //-------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Location", style: AppTextStyles.h4),
            InkWell(
              onTap: onDirectionsTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),

                child: Text(
                  "Direction",
                  style: AppTextStyles.labelExtraSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        //-------------------------------------
        // Fake Map
        //-------------------------------------
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.disabled.withValues(alpha: .7),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(painter: _MapGridPainter()),
                  ),
                  Center(
                    child: Container(
                      width: 52.r,
                      height: 52.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 18.h),

        //-------------------------------------
        // Venue
        //-------------------------------------
        Text(
          venueName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.h4,
        ),

        SizedBox(height: 6.h),

        Text(
          address,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodySmall,
        ),

        SizedBox(height: 18.h),

        //-------------------------------------
        // Button
        //-------------------------------------
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onDirectionsTap,
            icon: Icon(Icons.navigation, size: 20.sp),
            label: Text("Get Directions", style: AppTextStyles.button),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class _MapGridPainterWidget extends StatelessWidget {
//   const _MapGridPainterWidget();

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(painter: _MapGridPainter(), size: Size.infinite);
//   }
// }
class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = AppColors.surface
      ..strokeWidth = size.shortestSide * .04
      ..style = PaintingStyle.stroke;

    final borderPaint = Paint()
      ..color = AppColors.border
      ..strokeWidth = size.shortestSide * .01
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height * .35),
      Offset(size.width, size.height * .25),
      roadPaint,
    );

    canvas.drawLine(
      Offset(size.width * .25, 0),
      Offset(size.width * .75, size.height),
      roadPaint,
    );

    canvas.drawCircle(
      Offset(size.width * .55, size.height * .45),
      size.shortestSide * .08,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
