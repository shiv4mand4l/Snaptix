import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../shared/widgets/app_loader.dart';
import '../../../../shared/widgets/snaptix_app_bar_widget.dart';
import '../../../explore/presentation/pages/widgets/app_bar_action.dart';
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
            icon: Icons.share_outlined,
            onTap: () {
              context.read<ConfirmationBloc>().add(SharePressed());
            },
          ),
        ],
      ),
      body: BlocConsumer<ConfirmationBloc, ConfirmationState>(
        listener: (context, state) {
          if (state is ConfirmationActionSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                  backgroundColor: AppColors.textSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  content: Row(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.success,
                        size: 20.sp,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          state.actionName,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.surface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is ConfirmationInitial || state is ConfirmationLoading) {
            return const AppLoader();
          }

          if (state is ConfirmationLoaded ||
              state is ConfirmationActionSuccess) {
            final booking = state is ConfirmationLoaded
                ? state.bookingDetails
                : (state as ConfirmationActionSuccess).bookingDetails;

            return SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;

                  final horizontalPadding = width < 360
                      ? 16.w
                      : width < 600
                      ? 20.w
                      : 32.w;

                  return SingleChildScrollView(
                    // physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      top: 20.h,
                      bottom: 28.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SUCCESS HEADER
                        SuccessBadgeHeader(
                          eventName: booking.eventName,
                          subtitle: booking.confirmationMessage,
                        ),

                        SizedBox(height: 24.h),

                        // TICKET
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 430.w),
                          child: TicketCard(bookingDetails: booking),
                        ),

                        SizedBox(height: 28.h),

                        // ACTION BUTTONS
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500.w),
                          child: ConfirmationActionButtons(
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
                              context.read<ConfirmationBloc>().add(
                                SharePressed(),
                              );
                            },
                            onReturnToHome: () {
                              context.read<ConfirmationBloc>().add(
                                ReturnToHomePressed(),
                              );

                              // Replace current booking flow with Main screen.
                              context.go(AppRoutes.main);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }

          return Center(
            child: Text('Something went wrong', style: AppTextStyles.bodySmall),
          );
        },
      ),
    );
  }
}
