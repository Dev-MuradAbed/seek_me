import 'package:flutter/material.dart';

import 'index.dart';


/// Signature for a callback function used to report
/// dot tap-events
typedef OnDotClicked = void Function(int index);

/// A widget that draws a representation of pages count
/// Inside of a  [PageView]
///
/// Uses the [PageController.offset] to animate the active dot
class ExpandingIndicator extends StatefulWidget {
  /// Default constructor
  const ExpandingIndicator({
    required this.controller,
    required this.count,
    Key? key,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const ExpandingDotsEffect(),
  }) : super(key: key);

  /// The page view controller
  final PageController controller;

  /// Holds effect configuration to be used in the [BasicIndicatorPainter]
  final IndicatorEffect effect;

  /// Layout direction vertical || horizontal
  ///
  /// This will only rotate the canvas in which the dots are drawn.
  ///
  /// It will not affect [effect.dotWidth] and [effect.dotHeight]
  final Axis axisDirection;

  /// The number of pages
  final int count;

  /// If [textDirection] is [TextDirection.rtl], page direction will be flipped
  final TextDirection? textDirection;

  /// Reports dot taps
  final OnDotClicked? onDotClicked;

  @override
  State<ExpandingIndicator> createState() => _ExpandingIndicatorState();
}

mixin _SizeAndRotationCalculatorMixin {
  /// The size of canvas
  late Size size;

  /// Rotation quarters of canvas
  int quarterTurns = 0;

  BuildContext get context;

  TextDirection? get textDirection;

  Axis get axisDirection;

  int get count;

  IndicatorEffect get effect;

  void updateSizeAndRotation() {
    size = effect.calculateSize(count);

    /// if textDirection is not provided use the nearest directionality up the widgets tree;
    final bool isRTL =
        (textDirection ?? _getDirectionality()) == TextDirection.rtl;
    if (axisDirection == Axis.vertical) {
      quarterTurns = 1;
    } else {
      quarterTurns = isRTL ? 2 : 0;
    }
  }

  TextDirection? _getDirectionality() {
    return context
        .findAncestorWidgetOfExactType<Directionality>()
        ?.textDirection;
  }
}

class _ExpandingIndicatorState extends State<ExpandingIndicator>
    with _SizeAndRotationCalculatorMixin {
  @override
  void initState() {
    super.initState();
    updateSizeAndRotation();
  }

  @override
  void didUpdateWidget(covariant ExpandingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSizeAndRotation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, _) => SmoothIndicator(
        offset: _offset,
        count: count,
        effect: effect,
        onDotClicked: widget.onDotClicked,
        size: size,
        quarterTurns: quarterTurns,
      ),
    );
  }

  double get _offset {
    try {
      final double offset =
          widget.controller.page ?? widget.controller.initialPage.toDouble();
      return offset % widget.count;
    } catch (_) {
      return widget.controller.initialPage.toDouble();
    }
  }

  @override
  int get count => widget.count;

  @override
  IndicatorEffect get effect => widget.effect;

  @override
  Axis get axisDirection => widget.axisDirection;

  @override
  TextDirection? get textDirection => widget.textDirection;
}

/// Draws dot-ish representation of pages by
/// the number of [count] and animates the active
/// page using [offset]
class SmoothIndicator extends StatelessWidget {
  /// Default constructor
  const SmoothIndicator({
    required this.offset,
    required this.count,
    required this.size,
    Key? key,
    this.quarterTurns = 0,
    this.effect = const ExpandingDotsEffect(),
    this.onDotClicked,
  }) : super(key: key);

  /// The active page offset
  final double offset;

  /// Holds effect configuration to be used in the [BasicIndicatorPainter]
  final IndicatorEffect effect;

  /// The number of pages
  final int count;

  /// Reports dot-taps
  final OnDotClicked? onDotClicked;

  /// The size of canvas
  final Size size;

  /// The rotation of cans based on
  /// text directionality and [axisDirection]
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: GestureDetector(
        onTapUp: _onTap,
        child: CustomPaint(
          size: size,
          // rebuild the painter with the new offset every time it updates
          painter: effect.buildPainter(count, offset),
        ),
      ),
    );
  }

  void _onTap(dynamic details) {
    if (onDotClicked != null) {
      final int index =
          effect.hitTestDots(details.localPosition.dx, count, offset);
      if (index != -1 && index != offset.toInt()) {
        onDotClicked?.call(index);
      }
    }
  }
}

/// Unlike [ExpandinIndicator] this indicator is self-animated
/// and it only needs to know active index
///
/// Useful for paging widgets that does not use [PageController]
class AnimatedSmoothIndicator extends ImplicitlyAnimatedWidget {
  /// Default constructor
  const AnimatedSmoothIndicator({
    required this.activeIndex,
    required this.count,
    Key? key,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const ExpandingDotsEffect(),
    Curve curve = Curves.easeInOut,
    Duration duration = const Duration(milliseconds: 300),
    VoidCallback? onEnd,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
          onEnd: onEnd,
        );

  /// The index of active page
  final int activeIndex;

  /// Holds effect configuration to be used in the [BasicIndicatorPainter]
  final IndicatorEffect effect;

  /// layout direction vertical || horizontal
  final Axis axisDirection;

  /// The number of children in [PageView]
  final int count;

  /// If [textDirection] is [TextDirection.rtl], page direction will be flipped
  final TextDirection? textDirection;

  /// Reports dot-taps
  final Function(int index)? onDotClicked;

  @override
  AnimatedWidgetBaseState<AnimatedSmoothIndicator> createState() =>
      _AnimatedSmoothIndicatorState();
}

class _AnimatedSmoothIndicatorState
    extends AnimatedWidgetBaseState<AnimatedSmoothIndicator>
    with _SizeAndRotationCalculatorMixin {
  Tween<double>? _offset;

  @override
  void initState() {
    super.initState();
    updateSizeAndRotation();
  }

  @override
  void didUpdateWidget(covariant AnimatedSmoothIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSizeAndRotation();
  }

  @override
  void forEachTween(dynamic visitor) {
    _offset = visitor(
      _offset,
      widget.activeIndex.toDouble(),
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>;
  }

  @override
  int get count => widget.count;

  @override
  IndicatorEffect get effect => widget.effect;

  @override
  Axis get axisDirection => widget.axisDirection;

  @override
  TextDirection? get textDirection => widget.textDirection;

  @override
  Widget build(BuildContext context) {
    final Tween<double>? offset = _offset;
    if (offset == null) {
      throw 'Offset has not been initialized';
    }
    return SmoothIndicator(
      offset: offset.evaluate(animation),
      count: widget.count,
      effect: widget.effect,
      onDotClicked: widget.onDotClicked,
      size: size,
      quarterTurns: quarterTurns,
    );
  }
}
