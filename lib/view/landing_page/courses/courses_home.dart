import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';
import 'package:tab_animation/view/landing_page/courses/courses_all.dart';

import 'package:tab_animation/view/landing_page/courses/courses_study.dart';
import 'package:tab_animation/view/widgets/simple_tab_view.dart';

class CoursesHome extends StatefulWidget {
  CoursesHome({Key key}) : super(key: key);

  @override
  _CoursesHomeState createState() => _CoursesHomeState();
}

class _CoursesHomeState extends State<CoursesHome> {
  List<String> catagories = ["All", "Study", "Saved"];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(ScreenConstants.dblPadding),
            child: SimpleTabView(
              items: catagories,
              onSelectionChanged: (pos) {
                selectedCategory = pos;
                setState(() {});
              },
            ),
          ),
          if (selectedCategory == 0) Expanded(child: CoursesAll()),
          if (selectedCategory == 1) Expanded(child: CourseStudy())
        ],
      ),
    );
  }
}
