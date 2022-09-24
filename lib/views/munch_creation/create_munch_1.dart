import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/bottom_nav_routing.dart';

import '../../constants/colors.dart';

class Munch_Details extends StatefulWidget {
  const Munch_Details({super.key});

  @override
  State<Munch_Details> createState() => _Munch_DetailsState();
}

class _Munch_DetailsState extends State<Munch_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: main_color,
        title: const Text('MUNCH TIME!',
         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: text_color),
          ),
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.black),
          tooltip: "Cancel",
          onPressed: () {
             Navigator.of(context).pushNamedAndRemoveUntil(
                    main_nav,
                (route) => false,
                );
          },
          ),
          
      ),
      body: Container(
            
            margin: const EdgeInsets.only(top: 40.0, left:20.0, right: 20.0),
            // color : Colors.red,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:ListView( 
              children:[
                TextField (  
                decoration: InputDecoration(  
                  border: InputBorder.none,  
                  hintText: 'Event Name'  
                  ),  
                ),

                

                Text("SELECT GROUP", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: text_color)),

              ], 
            ),
    ),
    );
  }
}