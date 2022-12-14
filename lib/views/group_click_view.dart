import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nextmunch/constants/global_values.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/bottom_nav_routing.dart';
import "package:share/share.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';

class Group_Click extends StatefulWidget {
  const Group_Click({super.key});

  @override
  State<Group_Click> createState() => _Group_ClickState();
}

class _Group_ClickState extends State<Group_Click> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main_color,
        title: Text(group_name!, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: text_color),),
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: text_color),
          onPressed: () async {
            Navigator.of(context).pushNamedAndRemoveUntil(
                        main_nav,
                    (route) => false
            );
          },
          )
          ),
        body: TextButton(child: Text("SHARE INVITE ID"),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            String? group_id = prefs.getString('invite_id');
            Share.share("Group ID: $group_id");
          },   
          ),
    );
  }
}