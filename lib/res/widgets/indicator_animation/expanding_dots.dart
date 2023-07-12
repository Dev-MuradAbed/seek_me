import 'package:flutter/material.dart';

import 'index.dart';


/// Paints an expanding dot transition effect between active
/// and non-active dot
///
/// Live demo at
/// https://github.com/Milad-Akarie/smooth_page_indicator/blob/f7ee92e7413a31de77bfb487755d64a385d52a52/demo/expanding-dot.gif
class ExpandingDotsPainter extends BasicIndicatorPainter {
  /// Default constructor
  ExpandingDotsPainter({
    required double offset,
    required this.effect,
    required int count,
  }) : super(offset, count, effect);

  /// The painting configuration
  final ExpandingDotsEffect effect;

  @override
  void paint(Canvas canvas, Size size) {
    final int current = offset.floor();
    double drawingOffset = -effect.spacing;
    final double dotOffset = offset - current;

    for (int i = 0; i < count; i++) {
      Color color = effect.dotColor;
      final double activeDotWidth = effect.dotWidth * effect.expansionFactor;
      final double expansion =
          (dotOffset / 2 * ((activeDotWidth - effect.dotWidth) / .5));
      final double xPos = drawingOffset + effect.spacing;
      double width = effect.dotWidth;
      if (i == current) {
        // ! Both a and b are non nullable
        color = Color.lerp(effect.activeDotColor, effect.dotColor, dotOffset)!;
        width = activeDotWidth - expansion;
      } else if (i - 1 == current || (i == 0 && offset > count - 1)) {
        width = effect.dotWidth + expansion;
        // ! Both a and b are non nullable
        color = Color.lerp(
            effect.activeDotColor, effect.dotColor, 1.0 - dotOffset)!;
      }
      final double yPos = size.height / 2;
      final RRect rRect = RRect.fromLTRBR(
        xPos,
        yPos - effect.dotHeight / 2,
        xPos + width,
        yPos + effect.dotHeight / 2,
        dotRadius,
      );
      drawingOffset = rRect.right;
      canvas.drawRRect(rRect, dotPaint..color = color);
    }
  }
}
