

import 'package:ecommerce_app/Categories/adminhome.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';

import 'package:ecommerce_app/Orders/db.dart';
import 'package:ecommerce_app/Orders/users.dart';
import 'package:flutter/material.dart';

class adhome extends StatefulWidget {
  @override
  _adhomeState createState() => _adhomeState();
}

class _adhomeState extends State<adhome> {
  int _selectedindex = 0;
  List<Widget> widgetlist = <Widget>[
    adminhome(),
dashb(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      body: Center(
        child: widgetlist.elementAt(_selectedindex),
      ),
      bottomNavigationBar: SizedBox(
        height: displayHeight(context)*0.08,
              child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
              backgroundColor: Colors.black,
            ),
          ],
          currentIndex: _selectedindex,
          onTap: onItemTap,
        ),
      ),
    );
  }
}
