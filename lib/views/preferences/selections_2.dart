import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/routes.dart';

class Restaurant_Selection extends StatefulWidget {
  const Restaurant_Selection({super.key});

  @override
  State<Restaurant_Selection> createState() => _Restaurant_SelectionState();
}

class _Restaurant_SelectionState extends State<Restaurant_Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants Selection')),
      body: Column(children:[const Text('SELECT RESTAURANTS'),
      TextButton(onPressed: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
                    preferences3,
                    (route) => false,
          );
          },
                    
          child: const Text('Next'),

      )
      ],
    ),
    );
  }
}