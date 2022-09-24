import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/routes.dart';
import '../../database/db_update.dart';
var dietary_list = <String>{};

class Personal_Preferences extends StatefulWidget {
  const Personal_Preferences({super.key});

  @override
  State<Personal_Preferences> createState() => _Personal_PreferencesState();
}

class _Personal_PreferencesState extends State<Personal_Preferences> {
  double budget_value = 50;
  double distance_value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferences'),),
      body: Column(children: [
        Title(color: Colors.black, child: Text('MORE ABOUT YOU')),
        Title(color: Colors.black, child: Text('BUDGET')),
        Slider(
          value: budget_value,
          min: 0,
          max: 100,
          activeColor: Colors.red,
          divisions: 20,
          label: budget_value.round().toString(),
          onChanged: (value) => setState(() => this.budget_value = value),
        ),
        Title(color: Colors.black, child: Text('DISTANCE FROM YOU')),
        Slider(
          value: distance_value,
          min: 1,
          max: 20,
          activeColor: Colors.red,
          divisions: 20,
          label: distance_value.round().toString(),
          onChanged: (value) => setState(() => this.distance_value = value),
        ),
        Title(color: Colors.black, child: Text('Dietary Requirements')),
        Row(children: [
          TextButton(onPressed: (){dietary_list.add('Halal');}, child: Text('Halal')), 
          TextButton(onPressed: (){dietary_list.add('Vegan');}, child: Text('Vegan')), 
          TextButton(onPressed: (){dietary_list.add('Vegatarian');}, child: Text('Vegatarian')), 
          TextButton(onPressed: (){dietary_list.add('Kosher');}, child: Text('Kosher')), 
          TextButton(onPressed: (){dietary_list.add('Pescatarian');}, child: Text('Pescatarian')), 
        ],),
        TextButton(onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setDouble('budget', budget_value);
          await prefs.setDouble('distance', distance_value);
          await prefs.setString('dietary', dietary_list.toString());
          Preferences_UpdateDB(prefs.getString('email').toString(), prefs.getString('cuisines').toString(), prefs.getString('restaurants').toString(), prefs.getDouble('budget')?.toInt(), prefs.getDouble('distance')?.toInt(), prefs.getString('dietary').toString());
        }, child: Text('NEXT')), 
      ],
      )
      
    //   body: Column(children:[const Text('SELECT BUDGET'),
    //   // TextButton(onPressed: () async {
    //   //     Navigator.of(context).pushNamedAndRemoveUntil(
    //   //               preferences4,
    //   //               (route) => false,
    //   //     );
    //   //     },
                    
    //   //     child: const Text('Next'),

    //   // )
    //   ],
    // ),
    );
  }
}