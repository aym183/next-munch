import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/routes.dart';

class Personal_Preferences extends StatefulWidget {
  const Personal_Preferences({super.key});

  @override
  State<Personal_Preferences> createState() => _Personal_PreferencesState();
}

class _Personal_PreferencesState extends State<Personal_Preferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Preferences')),
      body: Column(children:[const Text('SELECT BUDGET'),
      TextButton(onPressed: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
                    preferences4,
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