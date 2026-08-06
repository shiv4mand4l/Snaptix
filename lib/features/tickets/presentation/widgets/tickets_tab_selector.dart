import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../pages/widgets/tab_item.dart';

class TicketsTabSelector extends StatelessWidget {
  const TicketsTabSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColors.disabled.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          TabItem(
            title: 'UPCOMING',
            isSelected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),

          SizedBox(width: 8.w),
          TabItem(
            title: 'PAST',
            isSelected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }
}
