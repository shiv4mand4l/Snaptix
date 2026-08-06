import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/saved_event_bloc.dart';
import '../bloc/saved_event_event.dart';

class FilterChipsRow extends StatelessWidget {
  final String selectedCategory;

  const FilterChipsRow({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final categories = ['All Events', 'Concerts', 'Workshops', 'Festivals'];

    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected =
              category.toLowerCase() == selectedCategory.toLowerCase();

          return GestureDetector(
            onTap: () {
              context.read<SavedEventsBloc>().add(FilterEvents(category));
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.border,
                borderRadius: BorderRadius.circular(20.r),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isSelected ? AppColors.surface : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
