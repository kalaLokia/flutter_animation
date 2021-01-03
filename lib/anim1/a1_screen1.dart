import 'package:flutter/material.dart';
import 'package:flutter_animation/main.dart';
import 'package:flutter_animation/anim1/a1_screen2.dart';

class A1Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildBuyTicketButton(),
      ),
    );
  }

  _buildBuyTicketButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: BuyButton(),
    );
  }
}

class BuyButton extends StatefulWidget {
  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> with TickerProviderStateMixin {
  String _buttonText = 'BUY TICKET';

  AnimationController _controller;
  Animation _roundnessAnimation;
  Animation _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    _roundnessAnimation = Tween(begin: 10.0, end: 25.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _widthAnimation = Tween(begin: 250.0, end: 40.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return A1Screen2();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonText = '';
            _controller.forward();
          });
        },
        child: Hero(
          tag: 'blackbox',
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            );
          },
          child: Container(
            width: _widthAnimation.value,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(_roundnessAnimation.value),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              _buttonText,
              textAlign: TextAlign.center,
              style: kStyle,
            ),
          ),
        ),
      ),
    );
  }
}
