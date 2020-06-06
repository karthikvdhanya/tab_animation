import 'package:flutter/material.dart';
import 'package:tab_animation/view/landing_page/courses/courses_home.dart';

import 'package:tab_animation/view/landing_page/home/home.dart';
import 'package:tab_animation/view/landing_page/profile/profile_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<Widget> _children = [Home(), CoursesHome(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: PageView(
        children: _children,
        controller: _pageController,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            color: Colors.white),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), title: Text('Cources')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
          ],
          currentIndex: selectedIndex,
          fixedColor: Theme.of(context).primaryColor,
          onTap: onItemTapped,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex =index;
    });
   _pageController.animateToPage(index, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }
}
