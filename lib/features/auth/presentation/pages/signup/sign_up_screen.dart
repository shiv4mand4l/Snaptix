import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../shared/widgets/snaptix_app_bar_widget.dart';

import 'widgets/signin_prompt.dart';
import 'widgets/signup_form.dart';
import 'widgets/signup_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      // Todo: Trigger SignUpBloc event here

      // Example:
      // context.read<AuthBloc>().add(
      //   SignUpEvent(
      //     fullName: fullNameController.text.trim(),
      //     email: emailController.text.trim(),
      //     password: passwordController.text,
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      resizeToAvoidBottomInset: true,

      appBar: SnaptixAppBarWidget(
        showLogo: false,
        title: '',
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),

                const SignUpHeader(),

                SizedBox(height: 35.h),

                SignUpForm(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  onSignUp: _onSignUp,
                ),

                SizedBox(height: 35.h),

                const SignInPrompt(),

                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
