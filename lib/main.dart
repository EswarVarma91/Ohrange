import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:ohrange/activity/Categories.dart';
import 'package:ohrange/activity/HomePage.dart';
import 'package:ohrange/activity/Profile.dart';
import 'package:ohrange/activity/Search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ohrange',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            bottomTapped(index);
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.green,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.category),
                title: Text('Categories'),
                activeColor: Colors.green),
            BottomNavyBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                activeColor: Colors.green),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Colors.green),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: <Widget>[HomePage(), Categories(), Search(),Profile()],
        ));
  }

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
