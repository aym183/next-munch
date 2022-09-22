import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;
import '../../constants/routes.dart';
var restaurant_list = <String>{};

class Restaurant_Selection extends StatefulWidget {
  const Restaurant_Selection({super.key});

  @override
  State<Restaurant_Selection> createState() => _Restaurant_SelectionState();
}

class _Restaurant_SelectionState extends State<Restaurant_Selection> {
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

                if(showData[index]['restaurant'].toString() == "BUTTON"){
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('restaurants', restaurant_list.toString());
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    preferences3,
                    (route) => false,
                    );
                }
                else{
                  restaurant_list.add(showData[index]['restaurant'].toString());
                  devtools.log(restaurant_list.toString());
                }
                

                // setState(() => isButtonActive = false);
                
               },
              child: Text(showData[index]['restaurant']),
              style: TextButton.styleFrom( //<-- SEE HERE
                side: BorderSide(width: 1.0),
              ),
          
              
            
            );
          },
          itemCount: showData?.length ?? 0,
        );
        
        },
        future: DefaultAssetBundle.of(context).loadString("json_files/restaurants.json"),
       
        ),
                    
        // child: const Text('Next Page'),

      ), 
    
    );
  }
}