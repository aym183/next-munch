import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/constants/global_values.dart';
import 'package:nextmunch/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
import '../constants/colors.dart';
import '../constants/routes.dart';
import '../database/db_read.dart';
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
        backgroundColor: main_color,
        title: const Text('NextMunch',
         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: text_color),
          ),
        elevation: 2,
        leading: IconButton(
          icon: Icon(Icons.add, color: text_color),
          onPressed: () async {
            if (selectedIndex == 1){
                
                // get_username(prefs.getString('email').toString());
                // devtools.log(group_names.toString());
                // final prefs = await SharedPreferences.getInstance();
                // List? answer = get_groups(prefs.getString('email').toString(), group_names);
                // devtools.log(prefs.getString('email').toString());
                // devtools.log(answer.toString());

                Navigator.of(context).pushNamedAndRemoveUntil(
                    creategroup1,
                (route) => false,
                );
            } else{
              Navigator.of(context).pushNamedAndRemoveUntil(
                    createmunch1,
                (route) => false,
                );
            }
          },
          ),
          
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