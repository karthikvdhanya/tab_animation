import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';

class CourseStudy extends StatefulWidget {
  CourseStudy({Key key}) : super(key: key);

  @override
  _CourseStudyState createState() => _CourseStudyState();
}

class _CourseStudyState extends State<CourseStudy>
    with SingleTickerProviderStateMixin {
  Animation slidingAnimation;
  AnimationController slidingBoxAnimationController;

  @override
  void initState() {
    super.initState();

    slidingBoxAnimationController = AnimationController(
        vsync: this,
        duration:
            Duration(milliseconds: ScreenConstants.animationDuration.floor()));

    /// Defining Tween animation

    slidingAnimation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
          parent: slidingBoxAnimationController, curve: Curves.easeInOut),
    );

    slidingBoxAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: slidingBoxAnimationController,
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(
                slidingAnimation.value * width, 0.0, 0.0),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home),
                    Text("No Cources"),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    slidingBoxAnimationController.dispose();
    super.dispose();
  }
}
