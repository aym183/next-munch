import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nextmunch/constants/colors.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'package:nextmunch/views/login_view.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'dart:developer' as devtools show log;

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_values.dart';
import '../database/db_read.dart';
// import 'firebase_options.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {

  int selectedIndex = 0;
  int _id = 0;

  // List<Widget> _widgetOptions = <Widget>[
  //   HomeView(),
  //   GroupsView(),
  // ];

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
      body: SingleChildScrollView(      
      child: Padding(
 
        padding: const EdgeInsets.all(5.0),
        child: Container(
          
          margin: const EdgeInsets.only(top: 40.0, left:20.0, right: 20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: new ListView(
                children: new List.generate(global_groups.length, (int index) {
               return new ListTile(
                
                leading: Icon(Icons.alarm_on_sharp),
                title: new Text(global_groups[index]),
                subtitle: Text("Sales of the week2"),
                trailing: Text('3500'),
                shape: RoundedRectangleBorder(
                side: BorderSide(color: text_color, width: 3),
                borderRadius: BorderRadius.circular(30),
                ),
                onTap:(){
                  setState((){
                    _id = index;
                    group_name = global_groups[index];
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        groupsClick,
                    (route) => false,
                    ); //if you want to assign the index somewhere to check
                  });                  
                },
                );
                
                })
                //   for (var i = 0; i < global_groups.length; i++) ListTile(
                //     leading: Icon(Icons.alarm_on_sharp),
                //     title: Text(global_groups[i]),
                //     subtitle: Text("Sales of the week2"),
                //     trailing: Text('3500'),
                //     onTap: (){},
                //     shape: RoundedRectangleBorder(
                //     side: BorderSide(color: text_color, width: 3),
                //     borderRadius: BorderRadius.circular(30),
                // ),
                //   )                               
                
              ),
              ),          
      ),
    ),    
    );
  }
}