import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/routes.dart';

class Profle_Details extends StatefulWidget {
  const Profle_Details({super.key});

  @override
  State<Profle_Details> createState() => _Profle_DetailsState();
}

class _Profle_DetailsState extends State<Profle_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Details')),
      body: Column(children:[const Text('UPLOAD PICTURE'),
      TextButton(onPressed: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
                    homeRoute,
                    (route) => false,
          );
          },
                    
          child: const Text('DONE'),

      )
      ],
    ),
    );
  }
}