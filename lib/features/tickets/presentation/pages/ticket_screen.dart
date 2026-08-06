import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/tickets/presentation/widgets/ticket_card.dart';
import 'package:flutter_task/shared/widgets/app_loader.dart';
import 'package:flutter_task/shared/widgets/snaptix_app_bar_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/app_floating_action_button.dart';
import '../../../explore/presentation/pages/widgets/app_bar_action.dart';
import '../../../explore/presentation/pages/widgets/near_you_event_card.dart';
import '../bloc/tickets_bloc.dart';
import '../widgets/tickets_header.dart';
import '../widgets/tickets_tab_selector.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int selectedTab = 0;

  @override
  void initState() {
    context.read<TicketsBloc>().add(OnLoadTickets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnaptixAppBarWidget(
        actions: [
          AppBarAction(icon: Icons.search_rounded, onTap: () {}),
          NotificationActionIcon(onTap: () {}, showBadge: false),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TicketsHeader(),
            SizedBox(height: 20.h),

            TicketsTabSelector(
              selectedIndex: selectedTab,
              onChanged: (index) {
                setState(() => selectedTab = index);

                context.read<TicketsBloc>().add(FilterTickets(index == 0));
              },
            ),

            SizedBox(height: 24.h),

            /// Only this rebuilds
            BlocBuilder<TicketsBloc, TicketsState>(
              builder: (context, state) {
                if (state is TicketFiltering) {
                  return const AppLoader();
                }

                if (state is TicketError) {
                  return Center(child: Text(state.message));
                }

                if (state is TicketLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.tickets.length,
                    itemBuilder: (context, index) {
                      final ticket = state.tickets[index];

                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: TicketCard(
                          ticket: ticket,
                          onViewTicketTap: () {
                            debugPrint(ticket.ticketId);
                          },
                        ),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: AppFloatingActionButton(
        icon: Icons.add,
        elevation: 4,

        backgroundColor: AppColors.primary,
        onPressed: () {
          // Edit
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
