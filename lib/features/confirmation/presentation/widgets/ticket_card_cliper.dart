import 'package:flutter/material.dart';

class TicketCardClipper extends CustomClipper<Path> {
  final double cutoutTop;
  final double cutoutRadius;
  final double borderRadius;
  const TicketCardClipper({
    required this.cutoutTop,
    required this.cutoutRadius,
    this.borderRadius = 16.0,
  });
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    // Top left starting after rounding
    path.moveTo(borderRadius, 0);
    // Top edge & Top right corner
    path.lineTo(w - borderRadius, 0);
    path.quadraticBezierTo(w, 0, w, borderRadius);
    // Right edge down to the cutout
    path.lineTo(w, cutoutTop - cutoutRadius);
    // Right cutout (inward semi-circle)
    path.arcToPoint(
      Offset(w, cutoutTop + cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );
    // Right edge down to bottom right corner
    path.lineTo(w, h - borderRadius);
    path.quadraticBezierTo(w, h, w - borderRadius, h);
    // Bottom edge & Bottom left corner
    path.lineTo(borderRadius, h);
    path.quadraticBezierTo(0, h, 0, h - borderRadius);
    // Left edge up to the cutout
    path.lineTo(0, cutoutTop + cutoutRadius);
    // Left cutout (inward semi-circle)
    path.arcToPoint(
      Offset(0, cutoutTop - cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );
    // Left edge up to top left corner
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
