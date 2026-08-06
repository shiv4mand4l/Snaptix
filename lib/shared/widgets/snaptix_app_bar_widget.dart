import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/text_styles.dart';

class SnaptixAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SnaptixAppBarWidget({
    super.key,
    this.title = AppStrings.appName,
    this.showLogo = true,
    this.leadingIcon = Icons.qr_code_scanner_outlined,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.backgroundColor = Colors.transparent,
    this.automaticallyImplyLeading = false,
  });

  final String title;

  final bool showLogo;

  final IconData leadingIcon;

  final List<Widget>? actions;

  final Widget? leading;

  final bool centerTitle;

  final Color backgroundColor;

  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final double horizontalSpacing = screenWidth < 360 ? 12.w : 20.w;

    final double logoSize = screenWidth < 360 ? 36.w : 42.w;

    final double logoIconSize = screenWidth < 360 ? 18.sp : 20.sp;

    return AppBar(
      backgroundColor: backgroundColor,

      elevation: 0,

      scrolledUnderElevation: 0,

      centerTitle: centerTitle,

      titleSpacing: horizontalSpacing,

      automaticallyImplyActions: automaticallyImplyLeading,

      leading: leading,

      title: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          if (showLogo) ...[
            Container(
              width: logoSize,

              height: logoSize,

              padding: EdgeInsets.all(6.r),

              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),

                borderRadius: BorderRadius.circular(10.r),
              ),

              child: Icon(
                leadingIcon,

                color: AppColors.primary,

                size: logoIconSize,
              ),
            ),

            SizedBox(width: 10.w),
          ],

          Flexible(
            child: Text(
              title,

              overflow: TextOverflow.ellipsis,

              maxLines: 1,

              style: AppTextStyles.h2.copyWith(fontSize: 20.sp),
            ),
          ),
        ],
      ),

      actions: actions,
    );
  }
}
