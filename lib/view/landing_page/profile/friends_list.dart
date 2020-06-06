import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({Key key}) : super(key: key);

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
            leading: Icon(Icons.person),
            title: Text("Neil Hudson"),
            subtitle: Text("134,679 XP"),
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text("Carry Briggs"),
            subtitle: Text("134,679 XP"),
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text("Ralph Torres"),
            subtitle: Text("134,679 XP"),
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text("Dora Hudson"),
            subtitle: Text("134,679 XP"),
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text("Harriet Simon"),
            subtitle: Text("134,679 XP"),
          )
        ],
      ),
    );
  }
}