import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class EventAboutSection extends StatefulWidget {
  final String description;
  final VoidCallback? onReadMoreTap;

  const EventAboutSection({
    super.key,
    required this.description,
    this.onReadMoreTap,
  });

  @override
  State<EventAboutSection> createState() => _EventAboutSectionState();
}

class _EventAboutSectionState extends State<EventAboutSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------
            // Title
            //---------------------------------------
            Text("About this event", style: AppTextStyles.h4),

            // SizedBox(height: 6.h),

            //---------------------------------------
            // Description
            //---------------------------------------
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              sizeCurve: Curves.easeInOut,
              crossFadeState: _expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,

              firstChild: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(
                    height: 1.4,
                    fontSize: 14,
                  ),
                ),
              ),

              secondChild: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.description,
                  style: AppTextStyles.caption.copyWith(
                    height: 1.4,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            // SizedBox(height: 12.h),

            //---------------------------------------
            // Read More
            //---------------------------------------
            InkWell(
              borderRadius: BorderRadius.circular(8.r),
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });

                widget.onReadMoreTap?.call();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 2.w),
                child: Text(
                  _expanded ? "Read Less" : "Read More",
                  style: AppTextStyles.buttonText,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
