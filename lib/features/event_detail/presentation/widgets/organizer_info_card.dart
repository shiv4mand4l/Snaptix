// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/constants/app_colors.dart';

// /// Card component showing Organizer profile, verification badge, rating, and Follow action.
// class OrganizerInfoCard extends StatelessWidget {
//   final String logoUrl;
//   final String name;
//   final double rating;
//   final String reviewsCount;
//   final bool isFollowing;
//   final VoidCallback? onFollowTap;

//   const OrganizerInfoCard({
//     super.key,
//     this.logoUrl =
//         'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe',
//     this.name = 'Snaptix Events Group',
//     this.rating = 4.9,
//     this.reviewsCount = '1.2k Reviews',
//     this.isFollowing = false,
//     this.onFollowTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
//       decoration: BoxDecoration(
//         color: AppColors.background,
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(color: AppColors.border, width: 1.r),
//       ),
//       child: Row(
//         children: [
//           // Logo Avatar with Green Verification Checkmark
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 width: 48.w,
//                 height: 48.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   border: Border.all(color: AppColors.border, width: 1.5.r),
//                   image: DecorationImage(
//                     image: NetworkImage(logoUrl),
//                     fit: BoxFit.cover,
//                     onError: (_, __) {},
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'snaptix',
//                     style: TextStyle(
//                       fontSize: 8.sp,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primary,
//                     ),
//                   ),
//                 ),
//               ),
//               // Verified Check Badge
//               Positioned(
//                 bottom: -2.h,
//                 right: -2.w,
//                 child: Container(
//                   padding: EdgeInsets.all(2.r),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.check_circle_rounded,
//                     color: AppColors.success,
//                     size: 14.sp,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(width: 12.w),

//           // Organizer Title & Rating Info
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                     color: AppColors.textPrimary,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4.h),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.star_border_rounded,
//                       color: AppColors.warning,
//                       size: 16.sp,
//                     ),
//                     SizedBox(width: 4.w),
//                     Text(
//                       rating.toStringAsFixed(1),
//                       style: TextStyle(
//                         color: AppColors.textPrimary,
//                         fontSize: 13.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Text(
//                       '($reviewsCount)',
//                       style: TextStyle(
//                         color: AppColors.disabled,
//                         fontSize: 13.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Follow Pill Button
//           GestureDetector(
//             onTap: onFollowTap,
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
//               decoration: BoxDecoration(
//                 color: isFollowing ? AppColors.info : AppColors.primary,
//                 borderRadius: BorderRadius.circular(24.r),
//               ),
//               child: Text(
//                 isFollowing ? 'Following' : 'Follow',
//                 style: TextStyle(
//                   color: isFollowing ? AppColors.primary : AppColors.surface,
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';

class OrganizerInfoCard extends StatelessWidget {
  final String logoUrl;
  final String name;
  final double rating;
  final String reviewsCount;

  final bool isFollowing;

  final VoidCallback onFollowTap;

  const OrganizerInfoCard({
    super.key,
    required this.logoUrl,
    required this.name,
    required this.rating,
    required this.reviewsCount,
    required this.isFollowing,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-----------------------------------------
        // Title
        //-----------------------------------------
        Text("Organizer", style: AppTextStyles.h3),

        SizedBox(height: 16.h),

        //-----------------------------------------
        // Card
        //-----------------------------------------
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.textDark.withValues(alpha: .06),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  logoUrl,
                  width: 64.w,
                  height: 64.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) {
                    return Container(
                      width: 64.w,
                      height: 64.w,
                      color: AppColors.disabled,
                      child: Icon(Icons.person, size: 32.sp),
                    );
                  },
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18.sp),

                        SizedBox(width: 4.w),

                        Text(
                          rating.toStringAsFixed(1),
                          style: AppTextStyles.labelSmall,
                        ),

                        SizedBox(width: 6.w),

                        Expanded(
                          child: Text(
                            "$reviewsCount Reviews",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyles.caption,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12.w),

              ElevatedButton(
                onPressed: onFollowTap,
                style: AppTheme.lightTheme.elevatedButtonTheme.style?.copyWith(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  ),
                  minimumSize: WidgetStatePropertyAll(Size(0, 40.h)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: WidgetStatePropertyAll(
                    isFollowing
                        ? AppColors.textHint.withValues(alpha: 0.9)
                        : AppColors.primary,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                ),
                child: Text(
                  isFollowing ? "Following" : "Follow",
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.surface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
