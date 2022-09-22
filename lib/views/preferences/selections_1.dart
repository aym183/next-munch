// import 'dart:html';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/views/preferences/selections_2.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
import '../../constants/routes.dart';
var cuisine_list = <String>{};
class Cuisine_Selection extends StatefulWidget {

  const Cuisine_Selection({super.key});
  
  // Future<void> readJson() async{
  //   final String response = await rootBundle.loadString('json_files/cuisines.json');
  //   final data = await json.decode(response);
  //   devtools.log(data);
  // }

  @override
  State<Cuisine_Selection> createState() => _Cuisine_SelectionState();
} 

class _Cuisine_SelectionState extends State<Cuisine_Selection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Cuisine Selection')),
      // body: Column(children:[const Text('SELECT CUISINES'),
      // TextButton(onPressed: () async {
      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //               preferences2,
      //               (route) => false,
      //     );
      //     },
      body: Center(
        child: FutureBuilder(builder: (context, snapshot){
        var showData = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return TextButton(
              onPressed: () async { 

                if(showData[index]['cuisine'].toString() == "BUTTON"){
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('cuisines', cuisine_list.toString());

                  Navigator.of(context).pushNamedAndRemoveUntil(
                    preferences2,
                    (route) => false,
                    );
                }
                else{
                  cuisine_list.add(showData[index]['cuisine'].toString());
                  devtools.log(cuisine_list.toString());
                }
                

                // setState(() => isButtonActive = false);
                
               },
              child: Text(showData[index]['cuisine']),
              style: TextButton.styleFrom( //<-- SEE HERE
                side: BorderSide(width: 1.0),
              ),
          
              
            
            );
          },
          itemCount: showData?.length ?? 0,
        );
        
        },
        future: DefaultAssetBundle.of(context).loadString("json_files/cuisines.json"),
       
        ),
                    
        // child: const Text('Next Page'),

      ), 
    
    );
  }
}

