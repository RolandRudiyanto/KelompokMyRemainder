import 'package:flutter/material.dart';
import 'package:uts2/View/history.dart';
import 'package:uts2/View/home.dart';


class Menu extends StatefulWidget {


  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedItem=0;
  static List<Widget> _page=<Widget>[
    Home(),
    History()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page.elementAt(_selectedItem),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History"
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue){
          setState(() {
            _selectedItem=setValue;
          });
        },
      ),
    );
  }
}