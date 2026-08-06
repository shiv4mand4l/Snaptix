import 'package:flutter/material.dart';

class QrPatternPainter extends CustomPainter {
  final Color color;

  const QrPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final double unit = size.width / 7;

    void drawEye(double x, double y) {
      // Outer square
      canvas.drawRect(Rect.fromLTWH(x, y, unit * 2, unit * 2), paint);

      // White middle
      canvas.drawRect(
        Rect.fromLTWH(x + unit * 0.5, y + unit * 0.5, unit, unit),
        Paint()..color = const Color(0xFFECEEFE),
      );

      // Inner square
      canvas.drawRect(
        Rect.fromLTWH(x + unit * 0.75, y + unit * 0.75, unit * 0.5, unit * 0.5),
        paint,
      );
    }

    // Three QR eyes
    drawEye(0, 0);
    drawEye(size.width - unit * 2, 0);
    drawEye(0, size.height - unit * 2);

    // QR pattern
    final points = <Offset>[
      Offset(unit * 3, unit * 1),
      Offset(unit * 4, unit * 0),
      Offset(unit * 3, unit * 3),
      Offset(unit * 4, unit * 2),
      Offset(unit * 5, unit * 3),
      Offset(unit * 2, unit * 4),
      Offset(unit * 3, unit * 5),
      Offset(unit * 5, unit * 5),
      Offset(unit * 6, unit * 4),
      Offset(unit * 4, unit * 6),
    ];

    for (final point in points) {
      canvas.drawRect(
        Rect.fromLTWH(point.dx, point.dy, unit * 0.8, unit * 0.8),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant QrPatternPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
