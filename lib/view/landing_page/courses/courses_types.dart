import 'package:flutter/material.dart';
import 'package:tab_animation/utils/delayed_list_item_publisher.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';
import 'package:tab_animation/utils/test_data.dart';
import 'package:tab_animation/view/landing_page/courses/cource_type.dart';
import 'package:tab_animation/view/widgets/animated_list_item.dart';

class CoursesTypes extends StatefulWidget {
  const CoursesTypes({Key key}) : super(key: key);

  @override
  _CoursesTypesState createState() => _CoursesTypesState();
}

class _CoursesTypesState extends State<CoursesTypes> {
  DelayedListItemPublisher _delayedListItemPublisher;
  ScrollController _controller;
  @override
  void initState() {
    _delayedListItemPublisher = DelayedListItemPublisher();
    super.initState();
  }

  @override
  void dispose() {
    _delayedListItemPublisher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = ScrollController();
    _delayedListItemPublisher.startAnimation(4, Duration(milliseconds: 0));

    return Container(
      height: ScreenConstants.catagoryTypeListHeight,
      child: ListView.builder(
       
        reverse: false,
        controller: _controller,
        itemBuilder: (con, pos) {
          return AnimatedListItem(
            duration: Duration(milliseconds: (ScreenConstants.animationDuration / (pos + ScreenConstants.horizontalListViewInitialItemDisplayCount) *ScreenConstants.horizontalListViewInitialItemDisplayCount).floor()),
            position: pos,
            child: CourceType(
              typeName: TestData.courses[pos].name,
              iconData: TestData.courses[pos].imagePath,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: TestData.courses.length,
      ),
    );
  }
}
