import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;
  CustomTabIndicator({required double radius})
      : _painter = _RectanglePainter(radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

enum TabPosition { top, bottom }

class _RectanglePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _RectanglePainter(this.radius) : _paint = Paint()..isAntiAlias = true;

  double height = 4;
  final TabPosition tabPosition = TabPosition.bottom;
  final double horizontalPadding = 0;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Size mySize =
        Size(configuration.size!.width - (horizontalPadding * 2), height);

    Offset myOffset = Offset(
      offset.dx + (horizontalPadding),
      offset.dy +
          (tabPosition == TabPosition.bottom
              ? configuration.size!.height - height
              : 0),
    );

    final Rect rect = myOffset & mySize;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          topRight: Radius.circular(radius),
          topLeft: Radius.circular(radius),
        ),
        _paint);
  }
}
