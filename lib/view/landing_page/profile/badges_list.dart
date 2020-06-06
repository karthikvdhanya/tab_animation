import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';

class BadgesList extends StatelessWidget {
  const BadgesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenConstants.dblRadius),
        color: Colors.white
      ),
      padding: EdgeInsets.all(ScreenConstants.dblPadding),
      margin: EdgeInsets.all(ScreenConstants.dblPadding),
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Perfectionist"),
            subtitle: Text("Finish all lessons of chapter"),
          ),
           ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Achiever"),
            subtitle: Text("Finish all lessons of chapter"),
          ),
           ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Scholor"),
            subtitle: Text("Finish all lessons of chapter"),
          ),
           ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Champoin"),
            subtitle: Text("Finish all lessons of chapter"),
          ),
           ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Focused"),
            subtitle: Text("Finish all lessons of chapter"),
          )
        ],
      ),
    );
  }
}
