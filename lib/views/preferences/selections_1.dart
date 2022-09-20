// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/routes.dart';

class Cuisine_Selection extends StatefulWidget {
  const Cuisine_Selection({super.key});

  @override
  State<Cuisine_Selection> createState() => _Cuisine_SelectionState();
}

class _Cuisine_SelectionState extends State<Cuisine_Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cuisine Selection')),
      body: Column(children:[const Text('SELECT CUISINES'),
      TextButton(onPressed: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
                    preferences2,
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