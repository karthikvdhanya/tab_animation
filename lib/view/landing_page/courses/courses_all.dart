import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';
import 'package:tab_animation/view/landing_page/courses/cource_type.dart';
import 'package:tab_animation/view/landing_page/courses/course_details.dart';
import 'package:tab_animation/view/landing_page/courses/courses_types.dart';

class CoursesAll extends StatefulWidget {
  CoursesAll({Key key}) : super(key: key);

  @override
  _CoursesAllState createState() => _CoursesAllState();
}

class _CoursesAllState extends State<CoursesAll>
    with SingleTickerProviderStateMixin {
  Animation slidingAnimation;
  AnimationController slidingBoxAnimationController;

  @override
  void initState() {
    super.initState();

    slidingBoxAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    /// Defining Tween animation

    slidingAnimation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
          parent: slidingBoxAnimationController, curve: Curves.fastOutSlowIn),
    );

    slidingBoxAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: slidingBoxAnimationController,
      builder: (BuildContext context, Widget child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(
                    slidingAnimation.value * width, 0.0, 0.0),
                child: Center(child: CoursesTypes()),
              ),
             
              Transform(
                transform: Matrix4.translationValues(
                    slidingAnimation.value * width, 0.0, 0.0),
                child: Center(
                  child: CourseDetails(),
                ),
              ),
              
              Transform(
                transform: Matrix4.translationValues(
                    slidingAnimation.value * width, 0.0, 0.0),
                child: Center(
                  child:CourseDetails(),
                ),
              ),
             
             
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    slidingBoxAnimationController.dispose();
    super.dispose();
  }
}
