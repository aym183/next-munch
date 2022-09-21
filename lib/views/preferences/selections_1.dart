// import 'dart:html';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:developer' as devtools show log;
import '../../constants/routes.dart';

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
      appBar: AppBar(title: const Text('Cuisine Selection')),
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
            return ListTile(
              title: Text(showData[index]['cuisine']),
              subtitle: Text('Test'),
            );
          },
          itemCount: showData?.length ?? 0,
        );
      },future: DefaultAssetBundle.of(context).loadString("json_files/cuisines.json"),
      ),
                    
      // child: const Text('Next Page'),

      ), 
    );
  }
}

