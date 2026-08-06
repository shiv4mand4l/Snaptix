import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

class CategoryChipsBar extends StatefulWidget {
  const CategoryChipsBar({super.key});

  @override
  State<CategoryChipsBar> createState() => _CategoryChipsBarState();
}

class _CategoryChipsBarState extends State<CategoryChipsBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'label': 'All', 'icon': Icons.flash_on_rounded},
    {'label': 'Music', 'icon': Icons.music_note_rounded},
    {'label': 'Tech', 'icon': Icons.terminal},
    {'label': 'Sports', 'icon': Icons.sports},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        itemCount: _categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedIndex == index;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24.r),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
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
                      category['icon'] as IconData,
                      size: 16.sp,
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      category['label'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : AppColors.textSecondary,
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
