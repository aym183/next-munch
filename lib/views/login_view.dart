import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/database/db_read.dart';
import 'package:nextmunch/errors/error_handling.dart';
import 'package:nextmunch/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nextmunch/views/bottom_nav_routing.dart';
import 'package:nextmunch/views/register_view.dart';
import 'package:nextmunch/main.dart';
import 'dart:developer' as devtools show log;

import 'package:shared_preferences/shared_preferences.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _email.dispose();
    _password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
            children: [
              TextField(
                controller: _email,
                // ignore: prefer_const_constructors
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Enter Email"
                ),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Enter Password"
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final email = _email.text.trim();
                    final password = _password.text.trim();
                   
                    try{
                      final user_credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);
                      devtools.log(user_credential.toString());
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', email);
                      get_username(email);
                      get_groups(email);
                      // await prefs.setString('username', username);
                      
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        main_nav,
                      (route) => false,
                      );
                    
                  } on FirebaseAuthException catch(e){
                      if(e.code == "user-not-found"){
                        // devtools.log('Weak Password');
                        await showErrorDialog(context, 'Error: ${e.code}');
                      }
                      else if(e.code == "wrong-password"){
                        await showErrorDialog(context, 'Error: ${e.code}');
                      }
                      else{
                        print(e.code);
                      }
                  }
                  },
                  child: const Text('Login'),        
                 
                ),
    
              TextButton(
                onPressed: (){ 
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/register/',
                    (route) => false,
                    );
              },
                  child: const Text('Not Registered Yet? Register Here!')
                  ),
    
            ],
            ),
    );
  }
}

// String first_login(String email){

//   final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();
//   StreamBuilder<QuerySnapshot>(stream: users, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot,
//                       ) {
//                         if(snapshot.hasError){
//                           return Text("Something went wrong");
//                         }
//                         if(snapshot.connectionState == ConnectionState.waiting){
//                           return Text('Loading');
//                         }
//                         final data = snapshot.requireData;
//                         return ListView.builder(
//                           itemCount: data.size,
//                           itemBuilder: (context, index){
//                             if(data.docs[index]['email'] == email && data.docs[index]['login_index'] == 0){
//                                return(Text('True'));
//                             }
//                             else{
//                               return(Text('False'));
//                             }
                          
                        
//                             // return Text("My name is ${data.docs[index]['name']} and I have logged in ${data.docs[index]['login_index']}");
  
// },
//                         );
//                       },
//   );
// }