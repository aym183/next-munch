import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nextmunch/constants/colors.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'package:nextmunch/views/login_view.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'dart:developer' as devtools show log;
// import 'firebase_options.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('GROUPS', style: TextStyle(color: text_color)),
      backgroundColor: main_color,

    );
  }
}