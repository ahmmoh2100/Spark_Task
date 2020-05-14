import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ComplexAnimation extends StatefulWidget {
  String imgURL;
  ComplexAnimation({this.imgURL});
  @override
  _ComplexAnimationState createState() =>
      _ComplexAnimationState(imgURL: imgURL);
}

class AnimatedSmile extends AnimatedWidget {
  String imgURL;

  static final opacity = new Tween(begin: 0.1, end: 1.0);
  static final size = new Tween(begin: 0.0, end: 65.0);
  static final rotate = new Tween(begin: 0.0, end: 12.5);
  AnimatedSmile({Key key, Animation<double> animation, this.imgURL})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Center(
      child: Transform.rotate(
        angle: rotate.evaluate(animation),
        child: Opacity(
          opacity: opacity.evaluate(animation),
          child: Container(
            width: size.evaluate(animation),
            height: size.evaluate(animation),
            child: Image.asset(imgURL),
          ),
        ),
      ),
    );
  }
}

class _ComplexAnimationState extends State<ComplexAnimation>
    with TickerProviderStateMixin {
  String imgURL;

  Animation<double> animation;
  AnimationController controller;

  _ComplexAnimationState({this.imgURL});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation.addStatusListener(listener);
    controller.forward();
  }

  void listener(AnimationStatus status) {
    //if (status == AnimationStatus.completed) 
      //controller.reverse();
    //else if(status==AnimationStatus.dismissed)
      //controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSmile(
        animation: animation,
        imgURL: imgURL,
      ),
    );
  }
}
