// import 'package:js/js.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/groups_view.dart';
import 'package:nextmunch/views/login_view.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:nextmunch/views/verify_email.dart';
import 'dart:developer' as devtools show log;
import 'firebase_options.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes:{
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        homeRoute : (context) => const HomeView(),
        groupsRoute : (context) => const GroupsView(),
        // '/verifyemail/': (context) => const VerifyEmailView(),
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
                  return HomeView();
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


enum MenuAction{ logout }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        height:140,
        // color: Colors.white,
      // padding: const EdgeInsets.symmetric(vertical:5),
    //     decoration: BoxDecoration(
    //     border: Border.all(
    //     color: Colors.black,
    //     ),
    //     boxShadow: [                                                               
    //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
    // ],    
    //     ),
      
    // borderRadius: BorderRadius.all(Radius.circular(150)) ),
        child: Padding(
          // padding: const EdgeInsets.all(8.0),
        

           padding: const EdgeInsets.symmetric(horizontal:85.0, vertical:20.0),
           child: GNav(
              // tabBorder: Border.all(color: Colors.black, width: 2),
              color: Colors.black,
              activeColor: Colors.white,
              tabActiveBorder: Border.all(color: Colors.black, width: 2),
              // tabActiveColor: Colors.white,
              iconSize: 40,
              tabBackgroundColor: Colors.purple,
              // padding: EdgeInsets.all(30),
              // textStyle: (Font),
              gap: 8,
              tabs: const[
                GButton(icon:Icons.home),
                GButton(icon:Icons.groups),
              ],
              onTabChange: (index){
                if(index == 1){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    groupsRoute, 
                    (route) => true,
                    );
                };
              },

            ),
      ),
    ),
    
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch(value){
              case MenuAction.logout:
                final shouldLogout = await ShowLogOutDialog(context);
                if(shouldLogout){
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute, 
                    (_) => false,
                    );
                }
            }
            // devtools.log(value.toString());
          },
          itemBuilder: (context){
            return const [
              PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Log Out'),
              )
            ];
          },)
        ],
      )
    );
  }
}



Future<bool> ShowLogOutDialog(BuildContext context){
  return showDialog<bool>(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            }, 
              child: const Text('Cancel'),
              ),
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            }, 
              child: const Text('Yes'),
              ),
        ],
      );
    }
    ).then((value) => value ?? false);
}