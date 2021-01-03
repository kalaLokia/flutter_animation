import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_animation/anim2/a2_screen1.dart';

void main() {
  runApp(MyApp());
}

final TextStyle kStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  decoration: TextDecoration.none,
);

final Color kCoolOrange = Color(0xFFF81934);
final Color kCoolOrange2 = Color(0xFFF66F3F);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 12.0;
    return MaterialApp(
      title: 'Customize Hero Demo',
      home: A2Screen1(),
    );
  }
}
