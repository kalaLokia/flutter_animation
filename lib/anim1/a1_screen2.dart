import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animation/main.dart';

class A1Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        createRectTween: _createRectTween,
        tag: 'blackbox',
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            'SCREEN 2',
            style: kStyle,
          ),
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect begin, Rect end}) : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final double width = lerpDouble(begin.width, end.width, t);
    double startWidthCenter = begin.left + (begin.width / 2);
    double startHeightCenter = begin.top + (begin.height / 2);
    // print(t); //Returns value from 0.0 to 1.0.
    return Rect.fromCircle(
        center: Offset(startWidthCenter, startHeightCenter),
        radius: width * 1.9);
  }
}
