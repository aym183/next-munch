import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/main.dart';

import '../../constants/colors.dart';
import '../../constants/routes.dart';

class Group_Details extends StatefulWidget {
  const Group_Details({super.key});

  @override
  State<Group_Details> createState() => _Group_DetailsState();
}

class _Group_DetailsState extends State<Group_Details> {
  get main_color => null;

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: main_color,
        title: const Text('CREATE GROUP',
         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: text_color),
          ),
        leading: IconButton(
          icon: Icon(Icons.cancel, color: text_color),
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
            child: Column( 
                children: [
                  TextField (  
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(  
                    border: InputBorder.none,  
                    hintText: 'GROUP NAME'  
                    ),  
                  ),
                  Icon(Icons.person, size: 250, color: text_color,),
                  TextButton(
                    onPressed: (() {
                      
                    }),
                     
                    // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: text_color)
                    child: const Text("GROUP ICON"),
                  ),
                ],
            ),
    ),
    );
  }
}