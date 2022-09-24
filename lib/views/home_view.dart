import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'dart:developer' as devtools show log;

import '../constants/colors.dart';

enum MenuAction{ logout }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
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
      //     ),//   body: SingleChildScrollView(
        
      // color : Colors.red,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
          //  body: _widgetOptions.elementAt(selectedIndex
      
      body: SingleChildScrollView(
        
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
            

            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.alarm_on_sharp),
                  title: Text("Sales"),
                  subtitle: Text("Sales of the week"),
                  trailing: Text('3500'),
                  onTap: (){},
                  shape: RoundedRectangleBorder(
                  side: BorderSide(color: text_color, width: 3),
                  borderRadius: BorderRadius.circular(30),
                  
    ), 
                  ),
              ],
            )
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



Future<bool> ShowLogOutDialog(BuildContext context){
  return showDialog<bool>(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            }, 
              child: const Text('Cancel'),
              ),
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            }, 
              child: const Text('Yes'),
              ),
        ],
      );
    }
    ).then((value) => value ?? false);
}

// MIGHT NEED TO CHANGE AND REPLACE ID WITH EMAIL SO WE CAN LOCATE WHERE TO ADD PREFERENCES.

// appBar: AppBar(
        //   title: const Text('Home'),
        //   actions: [
        //     PopupMenuButton<MenuAction>(onSelected: (value) async {
        //       switch(value){
        //         case MenuAction.logout:
        //           final shouldLogout = await ShowLogOutDialog(context);
        //           if(shouldLogout){
        //             await FirebaseAuth.instance.signOut();
        //             Navigator.of(context).pushNamedAndRemoveUntil(
        //               loginRoute, 
        //               (_) => false,
        //               );
        //           }
        //       }
        //       // devtools.log(value.toString());
        //     },
        //     itemBuilder: (context){
        //       return const [
        //         PopupMenuItem<MenuAction>(
        //           value: MenuAction.logout,
        //           child: Text('Log Out'),
        //         )
        //       ];
        //     },)
        //   ],
        // )