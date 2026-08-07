import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styles.dart';

class TicketsHeader extends StatelessWidget {
  const TicketsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Tickets', style: AppTextStyles.ticketTitle),
        SizedBox(height: 6.h),
        Text(
          'Manage your upcoming and past event\nexperiences.',
          style: AppTextStyles.bodySmall.copyWith(height: 1.2),
        ),
      ],
    );
  }
}
