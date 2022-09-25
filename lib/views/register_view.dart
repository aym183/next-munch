import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nextmunch/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as devtools show log;

import '../database/db_create.dart';
import '../errors/error_handling.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _username;


  @override
  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _email.dispose();
    _password.dispose();
    _username.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Column(
            children: [
              TextField(
                controller: _username,
                // ignore: prefer_const_constructors
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: true,
                decoration: const InputDecoration(
                  hintText: "Username"
                ),
              ),
              TextField(
                controller: _email,
                // ignore: prefer_const_constructors
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Email"
                ),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Password"
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final email = _email.text.trim();
                    final password = _password.text.trim();
                    final username = _username.text.trim();
                  
                    try{
                      final user_credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                      devtools.log(user_credential.toString());
                      final user = FirebaseAuth.instance.currentUser;
                      user?.sendEmailVerification();
                      Insert_user_intoDB(username, email);
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', email);
                      await prefs.setString('username', username);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        verifyRoute,
                        (route) => false,
                      );
                  } on FirebaseAuthException catch(e){
                      if(e.code == "weak-password"){
                        await showErrorDialog(context, 'Error: ${e.code}');
                      }
                      else if(e.code == "email-already-in-use"){
                        await showErrorDialog(context, 'Error: ${e.code}');
                      }
                      else if(e.code == "invalid-email"){
                        await showErrorDialog(context, 'Error: ${e.code}');
                      }
                      
                  }
                  },
                  child: const Text('Register'),        
                 
                ),
              TextButton(
              onPressed: (){ 
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                  );
            },
                child: const Text('Have an account? Sign in!')
                ),
            ],
            ),
    );
  }
}
