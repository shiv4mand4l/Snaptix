import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/saved_event_bloc.dart';
import '../bloc/saved_event_event.dart';

class FilterChipsRow extends StatelessWidget {
  final int selectedCategoryId;

  const FilterChipsRow({super.key, required this.selectedCategoryId});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'id': 0, 'title': 'All Events'},
      {'id': 1, 'title': 'Concerts'},
      {'id': 2, 'title': 'Workshops'},
      {'id': 3, 'title': 'Festivals'},
      {'id': 4, 'title': 'Musics'},
      {'id': 5, 'title': 'hello'},
      {'id': 6, 'title': 'hiiiii'},
    ];
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final category = categories[index];

          final int categoryId = category['id'] as int;
          final String categoryTitle = category['title'] as String;

          final bool isSelected = categoryId == selectedCategoryId;

          return GestureDetector(
            onTap: () {
              context.read<SavedEventsBloc>().add(
                FilterEvents(categoryTitle, categoryId),
              );
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
                categoryTitle,
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
