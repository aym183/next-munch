// import 'package:js/js.dart';
// import 'dart:js';

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nextmunch/constants/colors.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/bottom_nav_routing.dart';
import 'package:nextmunch/views/group_creation/create_group_1.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'package:nextmunch/views/login_view.dart';
import 'package:nextmunch/views/munch_creation/create_munch_1.dart';
import 'package:nextmunch/views/preferences/selections_4.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:nextmunch/views/verify_email.dart';
import 'package:nextmunch/views/preferences/selections_1.dart';
import 'package:nextmunch/views/preferences/selections_2.dart';
import 'package:nextmunch/views/preferences/selections_3.dart';
import 'dart:developer' as devtools show log;
import 'firebase_options.dart';
import 'views/home_view.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterView(),
      routes:{
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        homeRoute : (context) => const HomeView(),
        groupsRoute : (context) => const GroupsView(),
        verifyRoute : (context) => const VerifyEmailView(),
        preferences1: (context) => const Cuisine_Selection(),
        preferences2: (context) => const Restaurant_Selection(),
        preferences3: (context) => const Personal_Preferences(),
        preferences4: (context) => const Profle_Details(),
        creategroup1: (context) => const Group_Details(),
        createmunch1: (context) => const Munch_Details(),
        main_nav: (context) => const bottom_nav_route(),
      }
    ),
    );
}

//stl -> shortcut widget
//stf

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if(user != null){
                if (user.emailVerified){
                  return bottom_nav_route();
                }
                else{
                  return const VerifyEmailView();
                }
              }
              else {
                return const LoginView();
              }
              // return const Text('Done'); 
              
              // if(user?.emailVerified ?? false){
              //   return const Text('done');
              // }
              // else{
              //   return const VerifyEmailView();
              // }
              // return LoginView(); 

            default:
              return const Text('Loading....');
          }
          
        } ,      
    );
  }
}


