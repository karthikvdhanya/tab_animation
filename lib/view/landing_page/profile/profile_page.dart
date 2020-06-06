import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';
import 'package:tab_animation/view/landing_page/profile/badges_list.dart';
import 'package:tab_animation/view/landing_page/profile/friends_list.dart';
import 'package:tab_animation/view/landing_page/profile/score_list.dart';
import 'package:tab_animation/view/widgets/simple_tab_view.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Icon(Icons.settings)],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      maxRadius: 85,
                      backgroundImage: AssetImage(
                        "assets/img_1.jpg",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Antonio Perez",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Text("134,679 XP"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleTabView(
                items: [
                  "BADGES",
                  "FRIENDS",
                  "SCORES",
                ],
                onSelectionChanged: (pos) {
                  _pageController.animateToPage(
                    pos,
                    duration: Duration(
                      milliseconds: ScreenConstants.animationDuration.floor(),
                    ),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    BadgesList(),
                    FriendsList(),
                    ScoreList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
