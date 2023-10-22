import 'dart:async';
import 'package:flutter/material.dart';

class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({required this.child, required this.delay, Key? key})
      : super(key: key);

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  bool isControllerDisposed = false;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      if (!isControllerDisposed) {
        _animController!.forward();
      }
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        if (!isControllerDisposed) {
          _animController!.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    isControllerDisposed = true;
    _animController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset!,
        child: widget.child,
      ),
      opacity: _animController!,
    );
  }
}
