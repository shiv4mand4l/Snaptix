import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/shared/widgets/snaptix_app_bar_widget.dart';

import 'widgets/forgot_password_bottom.dart';
import 'widgets/forgot_password_form.dart';
import 'widgets/forgot_password_header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnaptixAppBarWidget(showLogo: false, title: ''),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),

                      // Header
                      const ForgotPasswordHeader(),

                      SizedBox(height: 40.h),

                      // Form
                      ForgotPasswordForm(
                        formKey: _formKey,
                        emailController: _emailController,
                        onSubmit: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),

                      const Spacer(),

                      // Bottom
                      const ForgotPasswordBottom(),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
