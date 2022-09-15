// import 'package:js/js.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmunch/views/login_view.dart';
import 'package:nextmunch/views/register_view.dart';

import 'firebase_options.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes:{
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
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
              // final user = FirebaseAuth.instance.currentUser;
              
              // if(user?.emailVerified ?? false){
              //   return const Text('done');
              // }
              // else{
              //   return const VerifyEmailView();
              // }
              return LoginView(); 

            default:
              return const Text('Loading....');
          }
          
        } ,      
    );
  }
}