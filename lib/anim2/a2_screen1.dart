import 'package:flutter/material.dart';

import '../main.dart';
import 'a2_screen2.dart';
import 'a2_widgets.dart';

class A2Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RatingBar(
              size: 25,
              rating: 4,
            ),
            SizedBox(
              height: 60,
            ),
            FlatButton(
              color: kCoolOrange2,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return A2Screen2();
                  }),
                );
              },
              child: Text('Go to next screen'),
            )
          ],
        ),
      ),
    );
  }
}
