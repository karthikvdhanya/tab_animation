import 'package:flutter/material.dart';

class CourseStudy extends StatefulWidget {
  CourseStudy({Key key}) : super(key: key);

  @override
  _CourseStudyState createState() => _CourseStudyState();
}

class _CourseStudyState extends State<CourseStudy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Icon(Icons.home), Text("No Cources")],
        ),
      ),
    );
  }
}
