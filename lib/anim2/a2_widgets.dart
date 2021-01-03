import 'package:flutter/material.dart';

import '../main.dart';

class RatingBar extends StatelessWidget {
  final rating;
  final double size;

  const RatingBar({
    this.rating,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Hero(
            tag: 'star$index',
            createRectTween: (begin, end) {
              return _createRectTween(begin, end, index);
            },
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: kCoolOrange,
              size: size,
            ),
          );
        }),
      ),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end, int index) {
    switch (index) {
      case 0:
//        easeOutExpo
        return CustomRectTween(
            begin: begin, end: end, cubic: Cubic(0.19, 1.0, 0.22, 1.0));
      case 1:
//        easeOutQuint
        return CustomRectTween(
            begin: begin, end: end, cubic: Cubic(0.23, 1.0, 0.32, 1.0));
      case 2:
//        easeOutQuart
        return CustomRectTween(
            begin: begin, end: end, cubic: Cubic(0.165, 0.84, 0.44, 1.0));
      case 3:
//        easeOutCubic
        return CustomRectTween(
            begin: begin, end: end, cubic: Cubic(0.215, 0.61, 0.355, 1.0));
      case 4:
//        easeOutQuad
        return CustomRectTween(
            begin: begin, end: end, cubic: Cubic(0.25, 0.46, 0.45, 0.94));
    }
  }
}

class CustomRectTween extends RectTween {
  Cubic _cubic;

  CustomRectTween({Rect begin, Rect end, Cubic cubic})
      : super(begin: begin, end: end) {
    _cubic = cubic;
  }

  @override
  Rect lerp(double t) {
    double height = end.top - begin.top;
    double width = end.left - begin.left; //Width is not changing here [= 0]

    double transformedY = _cubic.transform(t);

    double animatedX = begin.left + (t * width);
    double animatedY = begin.top + (transformedY * height);

    return Rect.fromLTWH(animatedX, animatedY, 1, 1);
  }
}
