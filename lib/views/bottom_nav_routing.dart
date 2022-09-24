import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/views/home_view.dart';

import '../constants/colors.dart';
import 'groups_view.dart';

class bottom_nav_route extends StatefulWidget {
  const bottom_nav_route({super.key});
  

  @override
  State<bottom_nav_route> createState() => _bottom_nav_routeState();
}

class _bottom_nav_routeState extends State<bottom_nav_route> {
  int selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    GroupsView(),
  ];

  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
      // devtools.log(selectedIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      appBar: AppBar(
        title: const Text('NextMunch',
         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: text_color),
          ),
        elevation: 2,
        backgroundColor: main_color,
      ),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar:  BottomNavigationBar(
              
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.groups),
                  label: 'Groups',
                  ),

              ],
              currentIndex: selectedIndex,
              onTap: onItemTap,
              backgroundColor: main_color,
          
          ),
    );
  }
}