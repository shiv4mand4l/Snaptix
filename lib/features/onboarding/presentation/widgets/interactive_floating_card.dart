import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import 'ticket_card_content.dart';

class InteractiveFloatingCard extends StatefulWidget {
  const InteractiveFloatingCard({super.key});

  @override
  State<InteractiveFloatingCard> createState() =>
      _InteractiveFloatingCardState();
}

class _InteractiveFloatingCardState extends State<InteractiveFloatingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  Offset _dragOffset = Offset.zero;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -6.h, end: 6.h).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;

      _dragOffset = Offset(
        _dragOffset.dx.clamp(-150.0, 150.0),
        _dragOffset.dy.clamp(-150.0, 150.0),
      );
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _dragOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        final rotateX = _dragOffset.dy * 0.0008;
        final rotateY = -_dragOffset.dx * 0.0008;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(rotateX)
            ..rotateY(rotateY)
            // ignore: deprecated_member_use
            ..translate(0.0, _floatAnimation.value, 0.0),
          child: GestureDetector(
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    blurRadius: 30.r,
                    spreadRadius: 2.r,
                    offset: Offset(0, 15.h),
                  ),
                  BoxShadow(
                    color: AppColors.textDark.withValues(alpha: 0.08),
                    blurRadius: 15.r,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),
              child: const TicketCardContent(),
            ),
          ),
        );
      },
    );
  }
}
