import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';

class AvatarStack extends StatelessWidget {
  /// Number displayed in the last avatar (+count)
  final int count;

  /// Avatar colors (replace with images later if needed)
  final List<Color> avatarColors;

  /// Base avatar size
  final double size;

  /// Amount each avatar overlaps
  final double overlap;

  const AvatarStack({
    super.key,
    required this.count,
    this.avatarColors = const [
      Color(0xFFD0E1FD),
      Color(0xFFC6E0D2),
      Color(0xFFD4CBB6),
    ],
    this.size = 28,
    this.overlap = 8,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = size.w;
    final avatarOverlap = overlap.w;
    final borderWidth = 1.5.w;

    final visibleAvatars = avatarColors.length;

    final totalWidth =
        avatarSize + (visibleAvatars * (avatarSize - avatarOverlap));

    return SizedBox(
      width: totalWidth,
      height: avatarSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Avatar circles
          for (int i = 0; i < visibleAvatars; i++)
            Positioned(
              left: i * (avatarSize - avatarOverlap),
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  color: avatarColors[i],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.surface,
                    width: borderWidth,
                  ),
                ),
              ),
            ),

          // +Count Avatar
          Positioned(
            left: visibleAvatars * (avatarSize - avatarOverlap),
            child: Container(
              width: avatarSize,
              height: avatarSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.border.withValues(alpha: 0.8),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.surface,
                  width: borderWidth,
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    '+$count',
                    maxLines: 1,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
