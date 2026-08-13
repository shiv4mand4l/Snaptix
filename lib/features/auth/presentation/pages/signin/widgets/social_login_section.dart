import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../widgets/auth_social_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.border)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'Or continue with',
                style: AppTextStyles.caption.copyWith(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),

            const Expanded(child: Divider(color: AppColors.border)),
          ],
        ),

        SizedBox(height: 25.h),

        AuthSocialLoginButton(
          text: 'Google',
          icon: Icons.g_mobiledata,
          iconColor: AppColors.error,
          onPressed: () {
            // Todo: Google login
          },
        ),
      ],
    );
  }
}
