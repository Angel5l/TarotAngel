import 'package:flutter/material.dart';

class TarotPageBackground extends StatelessWidget {
  const TarotPageBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: ExcludeSemantics(
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.40,
                child: Image.asset(
                  'assets/images/AngelTarotAvatar.png',
                  width: 175,
                  height: 175,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
