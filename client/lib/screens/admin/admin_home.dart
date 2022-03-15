import 'package:client/screens/admin/flowerAdd.dart';
import 'package:client/screens/admin/flowerList.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List screens = [
    FlowerList(),
    FlowerAdd(),
  ];
  int currentIndex = 0;
  String _title = 'Admin';

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Flower List';
          }
          break;
        case 1:
          {
            _title = 'Add Flower';
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
                Navigator.pushNamed(context, '/adminHome');
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
            BottomNavigationBarItem(
                icon: Icon(Icons.view_headline), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          ]),
    );
  }
}
