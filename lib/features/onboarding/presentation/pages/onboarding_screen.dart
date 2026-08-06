// import 'package:flutter/material.dart';
// import 'package:flutter_task/core/routes/app_routes.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/constants/app_colors.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _entryController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _entryController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     _fadeAnimation = CurvedAnimation(
//       parent: _entryController,
//       curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
//           CurvedAnimation(
//             parent: _entryController,
//             curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
//           ),
//         );

//     _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _entryController,
//         curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
//       ),
//     );

//     _entryController.forward();
//   }

//   @override
//   void dispose() {
//     _entryController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 16),
//             // Header Logo
//             const Text(
//               'Pulse',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF383CC1),
//                 letterSpacing: -0.5,
//                 fontFamily: 'serif',
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Main Content Area
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Animated Ticket Card
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: _slideAnimation,
//                         child: ScaleTransition(
//                           scale: _scaleAnimation,
//                           child: const InteractiveFloatingCard(),
//                         ),
//                       ),
//                     ),

//                     // Bottom Text & CTA
//                     FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: SlideTransition(
//                         position: _slideAnimation,
//                         child: const _BottomContentSection(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Card combining smooth floating levitation and 3D drag-tilt interactive animation
// class InteractiveFloatingCard extends StatefulWidget {
//   const InteractiveFloatingCard({super.key});

//   @override
//   State<InteractiveFloatingCard> createState() =>
//       _InteractiveFloatingCardState();
// }

// class _InteractiveFloatingCardState extends State<InteractiveFloatingCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _floatController;
//   late Animation<double> _floatAnimation;

//   // Interactive 3D tilt offset
//   Offset _dragOffset = Offset.zero;

//   @override
//   void initState() {
//     super.initState();
//     // Continuous subtle floating levitation animation
//     _floatController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..repeat(reverse: true);

//     _floatAnimation = Tween<double>(begin: -6.0, end: 6.0).animate(
//       CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
//     );
//   }

//   @override
//   void dispose() {
//     _floatController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _floatAnimation,
//       builder: (context, child) {
//         // Calculate 3D perspective rotation matrix based on drag gestures
//         final rotateX = _dragOffset.dy * 0.0008;
//         final rotateY = -_dragOffset.dx * 0.0008;

//         return Transform(
//           transform: Matrix4.identity()
//             ..setEntry(3, 2, 0.001) // perspective
//             ..rotateX(rotateX)
//             ..rotateY(rotateY)
//             // ignore: deprecated_member_use
//             ..translate(0.0, _floatAnimation.value, 0.0),
//           alignment: Alignment.center,
//           child: GestureDetector(
//             onPanUpdate: (details) {
//               setState(() {
//                 _dragOffset += details.delta;
//                 // Clamp max tilt angles
//                 _dragOffset = Offset(
//                   _dragOffset.dx.clamp(-150.0, 150.0),
//                   _dragOffset.dy.clamp(-150.0, 150.0),
//                 );
//               });
//             },
//             onPanEnd: (_) {
//               // Smoothly return card to origin when drag finishes
//               setState(() {
//                 _dragOffset = Offset.zero;
//               });
//             },
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeOut,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(28),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF383CC1).withValues(alpha: 0.12),
//                     blurRadius: 30,
//                     spreadRadius: 2,
//                     offset: const Offset(0, 15),
//                   ),
//                   BoxShadow(
//                     color: Colors.black.withValues(alpha: 0.08),
//                     blurRadius: 15,
//                     offset: const Offset(0, 8),
//                   ),
//                 ],
//               ),
//               child: const TicketCardContent(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// /// Ticket Card Visual Layout
// class TicketCardContent extends StatelessWidget {
//   const TicketCardContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(28),
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Top Cover Image / Event Info
//             Stack(
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Color(0xFFEBEBFA),
//                         Color(0xFF888B9E),
//                         Color(0xFF3A3D4E),
//                         Color(0xFF1E202B),
//                       ],
//                       stops: [0.0, 0.5, 0.8, 1.0],
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Container(
//                     padding: const EdgeInsets.all(24.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // Access Pill Badge
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 14,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF3B41D8),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: const Text(
//                             'EXCLUSIVE ACCESS',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.w700,
//                               letterSpacing: 0.8,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         // Event Title
//                         const Text(
//                           'Neon Horizon\nFestival 2024',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                             height: 1.15,
//                             fontFamily: 'serif',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Middle Ticket Details (Section & Gate)
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 24.0,
//                 vertical: 20.0,
//               ),
//               child: Row(
//                 children: [
//                   // Section
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Section',
//                           style: TextStyle(
//                             color: Color(0xFF8E94A3),
//                             fontSize: 13,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'VIP Floor',
//                           style: TextStyle(
//                             color: Color(0xFF151828),
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'serif',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Vertical Divider
//                   Container(
//                     height: 36,
//                     width: 1,
//                     color: const Color(0xFFE2E4EB),
//                   ),
//                   const SizedBox(width: 24),
//                   // Entry Gate
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Entry Gate',
//                           style: TextStyle(
//                             color: Color(0xFF8E94A3),
//                             fontSize: 13,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'West-04',
//                           style: TextStyle(
//                             color: Color(0xFF151828),
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'serif',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Dashed Divider Line
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: CustomPaint(
//                 size: const Size(double.infinity, 1),
//                 painter: DashedLinePainter(color: const Color(0xFFDCDFE8)),
//               ),
//             ),

//             // Bottom Section (Ticket Code & QR Code)
//             Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         'A7-X29',
//                         style: TextStyle(
//                           color: Color(0xFF151828),
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: -0.5,
//                           fontFamily: 'serif',
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Order #8921-00',
//                         style: TextStyle(
//                           color: Color(0xFF8E94A3),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // QR Code Box
//                   const QrCodeContainer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Custom Dashed Line Painter for the ticket separation line
// class DashedLinePainter extends CustomPainter {
//   final Color color;

//   DashedLinePainter({required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     double dashWidth = 5;
//     double dashSpace = 4;
//     double startX = 0;
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 1;

//     while (startX < size.width) {
//       canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
//       startX += dashWidth + dashSpace;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// QR Code Container matching the purple accent visual
// class QrCodeContainer extends StatelessWidget {
//   const QrCodeContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 72,
//       height: 72,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFECEEFE),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Icon(Icons.qr_code_scanner_sharp),

//       // CustomPaint(
//       //   painter: QrPatternPainter(color: const Color(0xFF4342E6)),
//       // ),
//     );
//   }
// }

// /// Draws a stylized QR matrix
// class QrPatternPainter extends CustomPainter {
//   final Color color;

//   QrPatternPainter({required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = color;
//     final unit = size.width / 7;

//     // Corner eye anchors (top-left, top-right, bottom-left)
//     void drawEye(double x, double y) {
//       canvas.drawRect(Rect.fromLTWH(x, y, unit * 2, unit * 2), paint);
//       canvas.drawRect(
//         Rect.fromLTWH(x + unit * 0.5, y + unit * 0.5, unit, unit),
//         Paint()..color = const Color(0xFFECEEFE),
//       );
//       canvas.drawRect(
//         Rect.fromLTWH(x + unit * 0.75, y + unit * 0.75, unit * 0.5, unit * 0.5),
//         paint,
//       );
//     }

//     drawEye(0, 0);
//     drawEye(size.width - unit * 2, 0);
//     drawEye(0, size.height - unit * 2);

//     // Inner random data points pattern
//     final points = [
//       Offset(unit * 3, unit * 1),
//       Offset(unit * 4, unit * 0),
//       Offset(unit * 3, unit * 3),
//       Offset(unit * 4, unit * 2),
//       Offset(unit * 5, unit * 3),
//       Offset(unit * 2, unit * 4),
//       Offset(unit * 3, unit * 5),
//       Offset(unit * 5, unit * 5),
//       Offset(unit * 6, unit * 4),
//       Offset(unit * 4, unit * 6),
//     ];

//     for (final p in points) {
//       canvas.drawRect(Rect.fromLTWH(p.dx, p.dy, unit * 0.8, unit * 0.8), paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// /// Heading, Body, and Button section below the ticket
// class _BottomContentSection extends StatelessWidget {
//   const _BottomContentSection();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           'Book Tickets',
//           style: TextStyle(
//             color: Color(0xFF131526),
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             letterSpacing: -0.5,
//             fontFamily: 'serif',
//           ),
//         ),
//         const SizedBox(height: 12),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             'Secure your spot in seconds and enjoy instant entry to the most exclusive events.',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Color(0xFF7E8494),
//               fontSize: 15,
//               height: 1.45,
//             ),
//           ),
//         ),
//         const SizedBox(height: 32),

//         // Action Button
//         SizedBox(
//           width: double.infinity,
//           height: 58,
//           child: ElevatedButton(
//             onPressed: () {
//               context.pushReplacement(AppRoutes.signIn);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primary,
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text(
//                   'Get Started',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'serif',
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Icon(
//                   Icons.arrow_forward_rounded,
//                   color: Colors.white,
//                   size: 22,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),

//         // Footer Link
//         GestureDetector(
//           onTap: () {
//             context.go(AppRoutes.signIn);
//           },
//           child: RichText(
//             text: const TextSpan(
//               style: TextStyle(color: Color(0xFF7E8494), fontSize: 13),
//               children: [
//                 TextSpan(text: 'Already have an account? '),
//                 TextSpan(
//                   text: 'Sign In',
//                   style: TextStyle(
//                     color: AppColors.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/onboarding/presentation/widgets/bottom_content_section.dart';
import 'package:flutter_task/features/onboarding/presentation/widgets/interactive_floating_card.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entryController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _entryController,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(
        parent: _entryController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    _entryController.forward();
  }

  @override
  void dispose() {
    _entryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),

              /// Logo
              Text(
                'Pulse',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF383CC1),
                  letterSpacing: -0.5,
                  fontFamily: 'serif',
                ),
              ),

              SizedBox(height: 24.h),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: const InteractiveFloatingCard(),
                        ),
                      ),
                    ),

                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: const BottomContentSection(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
