import 'package:client/screens/diary/diary.dart';
import 'package:client/screens/forum/forum.dart';
import 'package:client/screens/profile/profile.dart';
import 'package:client/screens/search/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List screens = [
    Search(),
    Profile(),
    Diary(),
    Forum(),
  ];
  int currentIndex = 0;
  String _title = 'Flower App';

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'Profile';
          }
          break;
        case 2:
          {
            _title = 'Diary';
          }
          break;
        case 3:
          {
            _title = 'Forum';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adminList');
              },
              icon: Icon(Icons.admin_panel_settings_outlined))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.lightGreen,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          elevation: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Diary'),
            BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
          ]),
    );
  }
}
