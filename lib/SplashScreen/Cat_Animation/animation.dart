import 'package:flutter/material.dart';
import 'cat.dart';

//Animation used in splashscreen
class LoginAnimation extends StatefulWidget {
  LoginAnimationState createState() => LoginAnimationState();
}

class LoginAnimationState extends State<LoginAnimation>
    with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  initState() {
    super.initState();
    catController = AnimationController(
      duration: Duration(milliseconds: 60),
      vsync: this,
    );
    catAnimation = Tween(begin: -35.0, end: -80.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildBox(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

//This is used as box which hide cat behind itself, thats why hidden cat see
  Widget buildBox() {
    return Container(
      height: 120.0,
      width: 160.0,
      child: Center(
        child: Text(
          "CREDFLOW",
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 30),
        ),
      ),
    );
  }
}
