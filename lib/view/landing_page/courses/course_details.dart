import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({Key key}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenConstants.dblPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenConstants.dblRadius,
        ),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.rounded_corner,
            ),
            title: Text(
              "Fundamentals of Art",
              style: Theme.of(
                context,
              ).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (con, pos) {
              return ListTile(
                leading: Icon(Icons.done),
                title: Text("What is Art"),
                subtitle: Text("What doest it really mean"),
              );
            },
          ),
        ],
      ),
    );
  }
}
