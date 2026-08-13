import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/text_styles.dart';
import '../../../widgets/auth_logo.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: AuthLogo(logo: Icons.qr_code_scanner_outlined)),

        SizedBox(height: 30.h),

        Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: AppTextStyles.h2.copyWith(
            fontSize: 30.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff202124),
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          'Create your account to get started',
          textAlign: TextAlign.center,
          style: AppTextStyles.h2.copyWith(
            fontSize: 15.sp,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
