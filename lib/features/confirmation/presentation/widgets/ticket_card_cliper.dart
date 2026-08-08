import 'package:flutter/material.dart';

class TicketCardClipper extends CustomClipper<Path> {
  final double cutoutTop;
  final double cutoutRadius;
  final double borderRadius;

  const TicketCardClipper({
    required this.cutoutTop,
    required this.cutoutRadius,
    this.borderRadius = 16,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    final w = size.width;
    final h = size.height;

    final safeCutoutTop = cutoutTop.clamp(
      cutoutRadius + 10,
      h - cutoutRadius - 10,
    );

    // Top-left
    path.moveTo(borderRadius, 0);

    // Top
    path.lineTo(w - borderRadius, 0);

    // Top-right
    path.quadraticBezierTo(w, 0, w, borderRadius);

    // Right side → cutout
    path.lineTo(w, safeCutoutTop - cutoutRadius);

    path.arcToPoint(
      Offset(w, safeCutoutTop + cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );

    // Right → bottom
    path.lineTo(w, h - borderRadius);

    path.quadraticBezierTo(w, h, w - borderRadius, h);

    // Bottom
    path.lineTo(borderRadius, h);

    path.quadraticBezierTo(0, h, 0, h - borderRadius);

    // Left → cutout
    path.lineTo(0, safeCutoutTop + cutoutRadius);

    path.arcToPoint(
      Offset(0, safeCutoutTop - cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );

    // Left → top
    path.lineTo(0, borderRadius);

    path.quadraticBezierTo(0, 0, borderRadius, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant TicketCardClipper oldClipper) {
    return oldClipper.cutoutTop != cutoutTop ||
        oldClipper.cutoutRadius != cutoutRadius ||
        oldClipper.borderRadius != borderRadius;
  }
}
