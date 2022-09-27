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

  // List<String> groups = ['Group1', 'Group2', 'Group3'];
  
  // Future<List?> getGroups() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List<String>? groups = prefs.getStringList('groups');  
  //   devtools.log(groups.toString());
  // }

  // static final prefs = SharedPreferences.getInstance();
  // List<String>? groups = prefs.getStringList('groups');  
  
  // void getGroups2() async {
  //    final prefs = await SharedPreferences.getInstance();
  //     List<String>? groups = prefs.getStringList('groups');  
  //     devtools.log(groups.toString());
  // }
  
  
 @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      
      backgroundColor: main_color,
      
      // children: Container(
      //         height: 60,
      //         child: Text('NextMunch', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      //         decoration: BoxDecoration(
      //           border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
      //         ),
      //     ),

    
      body: SingleChildScrollView(
        
      // color : Colors.red,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
          //  body: _widgetOptions.elementAt(selectedIndex
      
      
      child: Padding(
        
        
        padding: const EdgeInsets.all(5.0),

        child: Container(
          
          margin: const EdgeInsets.only(top: 40.0, left:20.0, right: 20.0),
          // color : Colors.red,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
          // decoration: BoxDecoration(
          //   border: Border.all(color: text_color, width: 3)
          // ),
        //   future: getGroups(),
        // builder: (context, snapshot){
          
        // }

          child: ListView(
                
                children: [
                  for (var i = 0; i < global_groups.length; i++) ListTile(
                    leading: Icon(Icons.alarm_on_sharp),
                    title: Text(global_groups[i]),
                    subtitle: Text("Sales of the week2"),
                    trailing: Text('3500'),
                    onTap: (){},
                    shape: RoundedRectangleBorder(
                    side: BorderSide(color: text_color, width: 3),
                    borderRadius: BorderRadius.circular(30),
                ),
                  )
                                  
                ],
                // for(var i = 0; i<groups.length; i++){
                //   children.add(
                //     ListTile(
                //     leading: Icon(Icons.alarm_on_sharp),
                //     title: Text("Saleskhgv"),
                //     subtitle: Text("Sales of the week2"),
                //     trailing: Text('3500'),
                //     onTap: (){},
                //     shape: RoundedRectangleBorder(
                //     side: BorderSide(color: text_color, width: 3),
                //     borderRadius: BorderRadius.circular(30),
                // ), 
                //     ),
                //   );
          
                //   }
              ),
          // child: Text(button_select.toString()),
         
            // decoration: BoxDecoration(
              //   border: Border.all(color: Color.fromARGB(255, 244, 0, 0), width: 3),
              // ),
        
              ),          
      ),
    ),    
    );
  }
}