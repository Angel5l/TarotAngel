import 'dart:math';

import 'package:flutter/material.dart';

class TarotCardWidget extends StatefulWidget {
  final String cardFaceImage;
  final String cardBackImage;
  final bool isFlipped;
  final ValueChanged<bool>? onFlip;
  final VoidCallback? onPressed;

  const TarotCardWidget({
    super.key,
    required this.cardFaceImage,
    required this.cardBackImage,
    required this.isFlipped,
    this.onFlip,
    this.onPressed,
  });

  @override
  State<TarotCardWidget> createState() => TarotCardWidgetState();
}

class TarotCardWidgetState extends State<TarotCardWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _isFlipped = widget.isFlipped;
    if (_isFlipped) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant TarotCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFlipped != widget.isFlipped) {
      _isFlipped = widget.isFlipped;
      if (_isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _toggleCard() {
    final nextValue = !_isFlipped;
    if (nextValue) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFlipped = nextValue;
    widget.onFlip?.call(nextValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    return GestureDetector(
      onTap: () {
        if (_isFlipped) {
          widget.onPressed?.call();
        } else {
          _toggleCard();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * pi;
          final isPastHalfway = angle > pi / 2;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isPastHalfway
                ? Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Image.asset(
                        widget.cardFaceImage,
                        cacheWidth: constraints.hasBoundedWidth
                            ? (constraints.maxWidth * devicePixelRatio).round()
                            : null,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) => Image.asset(
                      widget.cardBackImage,
                      cacheWidth: constraints.hasBoundedWidth
                          ? (constraints.maxWidth * devicePixelRatio).round()
                          : null,
                      fit: BoxFit.cover,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
