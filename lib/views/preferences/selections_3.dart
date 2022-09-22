import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/routes.dart';
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
        TextButton(onPressed: (){
          print(dietary_list);
          print(distance_value);
          print(budget_value);
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