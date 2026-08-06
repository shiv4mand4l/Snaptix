import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_styles.dart';

class TrendingEventsSection extends StatelessWidget {
  const TrendingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    // Responsive card width
    final cardWidth = screenWidth < 600
        ? screenWidth * 0.75
        : screenWidth * 0.42;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //---------------------------------------
        // Header
        //---------------------------------------
        Row(
          children: [
            Expanded(
              child: Text(
                "Trending Now",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h3,
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(70.w, 40.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              ),
              onPressed: () {
                context.push(AppRoutes.ticket);
              },
              child: Text("View All", style: AppTextStyles.bodyMedium),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        //---------------------------------------
        // Cards
        //---------------------------------------
        SizedBox(
          height: 0.48.sh,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            itemCount: 4,
            separatorBuilder: (_, _) => SizedBox(width: 16.w),
            itemBuilder: (_, index) {
              return SizedBox(width: cardWidth, child: const AppCard());
            },
          ),
        ),
      ],
    );
  }
}
