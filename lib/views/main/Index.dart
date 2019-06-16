import 'package:flutter/material.dart';

import 'Community.dart';
import 'Home.dart';
import 'Mine.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  void onTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn
    );
  }

  void onPageChanged(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView.builder(
        onPageChanged: onPageChanged,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Home();
            case 1:
              return Community();
            case 2:
              return Mine();
          }
          return Container();
        },
        itemCount: 3,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('社区'), icon: Icon(Icons.message)),
          BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.person))
        ],
        currentIndex: _currentPageIndex,
        onTap: onTap,
      ),
    );
  }
}
