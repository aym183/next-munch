import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/database/db_create.dart';
import 'package:nextmunch/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/colors.dart';
import '../../constants/routes.dart';

class Group_Details extends StatefulWidget {
  const Group_Details({super.key});

  @override
  State<Group_Details> createState() => _Group_DetailsState();
}

class _Group_DetailsState extends State<Group_Details> {
  late final TextEditingController _group_name;

  @override
  void initState(){
    _group_name = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _group_name.dispose();
    super.dispose();
  }

  

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
                    controller: _group_name,
                    decoration: InputDecoration(  
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: text_color), //<-- SEE HERE
                      ),
                      hintText: 'GROUP NAME'  
                      ),  
                  ),

                  Icon(Icons.person, size: 250, color: text_color,),

                  ElevatedButton(
                    onPressed: (() {
                      
                    }),
                    style: ElevatedButton.styleFrom(
                      // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      side: BorderSide(width: 3.0),
                    ),                     
                    // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: text_color)
                    child: const Text("UPLOAD GROUP ICON"),
                  ),

                  ElevatedButton(
                    onPressed: (() async {
                      final group_name = _group_name.text.trim();
                      final prefs = await SharedPreferences.getInstance();
                      Insert_group_intoDB(group_name, prefs.getString('username').toString());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          main_nav,
                      (route) => false,
                      );

                    }),
                    style: ElevatedButton.styleFrom(
                      // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                      side: BorderSide(width: 3.0),
                    ),                     
                    // style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: text_color)
                    child: const Text("CREATE GROUP"),
                  ),

                  // Text('INVITE MEMBERS',
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: text_color),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  //       ElevatedButton(
                  //       onPressed: (() {}),
                  //       style: ElevatedButton.styleFrom(
                  //         side: BorderSide(width: 3.0),
                  //       ),                     
                  //       child: const Text("Add Munchers"),
                  //       ),

                  //       // Spacer(),
                  //       // SizedBox(width: 50,),

                  //       ElevatedButton(
                  //       onPressed: (() {}),
                  //       style: ElevatedButton.styleFrom(
                  //         side: BorderSide(width: 3.0),
                  //       ),                     
                  //       child: const Text("Share Invite"),
                  //       ),
                  //   ],
                  // ),

                  
                ],
            ),
    ),
    );
  }
}