import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/features/explore/presentation/bloc/explore_bloc.dart';

class CategoryChipsBar extends StatefulWidget {
  const CategoryChipsBar({super.key});

  @override
  State<CategoryChipsBar> createState() => _CategoryChipsBarState();
}

class _CategoryChipsBarState extends State<CategoryChipsBar> {
  // Keep track of selected category
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'id': 0, 'label': 'All', 'icon': Icons.flash_on_rounded},
    {'id': 1, 'label': 'Music', 'icon': Icons.music_note_rounded},
    {'id': 2, 'label': 'Tech', 'icon': Icons.terminal},
    {'id': 3, 'label': 'Sports', 'icon': Icons.sports},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 2.w),

        itemCount: _categories.length,

        separatorBuilder: (_, _) => SizedBox(width: 10.w),

        itemBuilder: (context, index) {
          final category = _categories[index];

          final int categoryId = category['id'] as int;
          final String categoryTitle = category['label'] as String;
          final IconData categoryIcon = category['icon'] as IconData;

          // Check which chip is selected
          final bool isSelected = _selectedIndex == index;

          return Material(
            color: Colors.transparent,

            child: InkWell(
              borderRadius: BorderRadius.circular(24.r),

              onTap: () {
                // Update selected UI
                setState(() {
                  _selectedIndex = index;
                });

                // Send category to Bloc
                context.read<ExploreBloc>().add(
                  SelectCategory(categoryId, categoryTitle),
                );
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,

                constraints: BoxConstraints(minHeight: 42.h, minWidth: 80.w),

                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),

                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.surface,

                  borderRadius: BorderRadius.circular(24.r),

                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.grey.shade300,
                    width: 1.w,
                  ),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      categoryIcon,
                      size: 16.sp,
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      categoryTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isSelected
                            ? AppColors.surface
                            : AppColors.textPrimary,
                        fontWeight: isSelected
                            ? FontWeight.w900
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
