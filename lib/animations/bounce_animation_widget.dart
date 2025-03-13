import 'package:flutter/material.dart';

class BounceAnimationWidget extends StatefulWidget {
  final Widget child;
  final AnimationController controller;

  const BounceAnimationWidget({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  _BounceAnimationWidgetState createState() => _BounceAnimationWidgetState();
}

class _BounceAnimationWidgetState extends State<BounceAnimationWidget> {
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _sizeAnimation = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _sizeAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
