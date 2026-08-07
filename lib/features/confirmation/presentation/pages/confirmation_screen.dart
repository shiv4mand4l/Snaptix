import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/presentation/pages/widgets/app_bar_action.dart';
import 'package:flutter_task/shared/widgets/app_loader.dart';
import 'package:flutter_task/shared/widgets/snaptix_app_bar_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/confirmation_bloc.dart';
import '../bloc/confirmation_event.dart';
import '../bloc/confirmation_state.dart';
import '../widgets/confirmation_action_button.dart';
import '../widgets/success_badge_header.dart';
import '../widgets/ticket_card.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnaptixAppBarWidget(
        automaticallyImplyLeading: false,

        actions: [
          AppBarAction(
            icon: Icons.share,
            onTap: () {
              context.read<ConfirmationBloc>().add(SharePressed());
            },
          ),
        ],
      ),
      body: BlocConsumer<ConfirmationBloc, ConfirmationState>(
        listener: (context, state) {
          if (state is ConfirmationActionSuccess) {
            // Display clean premium snackbar for user action feedback
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.textSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                margin: EdgeInsets.all(16.r),
                content: Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.success,
                      size: 20.sp,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      state.actionName,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.surface,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ConfirmationLoading || state is ConfirmationInitial) {
            return AppLoader();
          } else if (state is ConfirmationLoaded ||
              state is ConfirmationActionSuccess) {
            // Fetch booking model from active state
            final booking = state is ConfirmationLoaded
                ? state.bookingDetails
                : (state as ConfirmationActionSuccess).bookingDetails;

            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    children: [
                      // 1. Success Message Title Section
                      SuccessBadgeHeader(
                        eventName: booking.eventName.replaceFirst(
                          ' Festival 2024',
                          '',
                        ),
                        subtitle: booking.confirmationMessage,
                      ),
                      SizedBox(height: 28.h),

                      // 2. Main Ticket Card
                      TicketCard(bookingDetails: booking),
                      SizedBox(height: 32.h),

                      // 3. User Actions buttons
                      ConfirmationActionButtons(
                        onViewTickets: () {
                          context.read<ConfirmationBloc>().add(
                            ViewTicketsPressed(),
                          );
                        },
                        onAddToWallet: () {
                          context.read<ConfirmationBloc>().add(
                            AddToWalletPressed(),
                          );
                        },
                        onAddToCalendar: () {
                          context.read<ConfirmationBloc>().add(
                            AddToCalendarPressed(),
                          );
                        },
                        onShareWithFriends: () {
                          context.read<ConfirmationBloc>().add(SharePressed());
                        },
                        onReturnToHome: () {
                          context.read<ConfirmationBloc>().add(
                            ReturnToHomePressed(),
                          );
                          context.go(AppRoutes.main);
                        },
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            );
          }

          return Center(
            child: Text('Something went wrong', style: AppTextStyles.nepali),
          );
        },
      ),
    );
  }
}
