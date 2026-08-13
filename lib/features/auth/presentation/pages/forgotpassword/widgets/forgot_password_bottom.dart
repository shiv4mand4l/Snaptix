import 'package:flutter/material.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordBottom extends StatelessWidget {
  const ForgotPasswordBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => context.go(AppRoutes.signIn),
        child: Text('Back to Login', style: AppTextStyles.bodySmall),
      ),
    );
  }
}
