import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'package:nextmunch/views/login_view.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'dart:developer' as devtools show log;
// import 'firebase_options.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        height:140,
        // color: Colors.white,
      // padding: const EdgeInsets.symmetric(vertical:5),
    //     decoration: BoxDecoration(
    //     border: Border.all(
    //     color: Colors.black,
    //     ),
    //     boxShadow: [                                                               
    //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
    // ],    
    //     ),
      
    // borderRadius: BorderRadius.all(Radius.circular(150)) ),
        child: Padding(
          // padding: const EdgeInsets.all(8.0),
        

           padding: const EdgeInsets.symmetric(horizontal:85.0, vertical:20.0),
           child: GNav(
              // tabBorder: Border.all(color: Colors.black, width: 2),
              color: Colors.black,
              activeColor: Colors.white,
              tabActiveBorder: Border.all(color: Colors.black, width: 2),
              // tabActiveColor: Colors.white,
              iconSize: 40,
              tabBackgroundColor: Colors.purple,
              // padding: EdgeInsets.all(30),
              // textStyle: (Font),
              gap: 8,
              tabs: const[
                GButton(icon:Icons.home),
                GButton(icon:Icons.groups),
              ],
              selectedIndex: 1,
              // onTabChange: (index){
              //   // if(index == 1){
              //   //   Navigator.of(context).pushNamedAndRemoveUntil(
              //   //     groupsRoute, 
              //   //     (route) => false,
              //   //     );
              //   // };
              // },

            ),
      ),
    ),
    
      appBar: AppBar(
        title: const Text('Groups Page'),
        
      )
    );
  }
}