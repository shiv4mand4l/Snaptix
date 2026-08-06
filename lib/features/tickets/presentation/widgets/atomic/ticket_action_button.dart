import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import '../../../../../../core/constants/app_colors.dart';

class TicketActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const TicketActionButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Text(text, style: AppTextStyles.buttonTicket),
      ),
    );
  }
}
