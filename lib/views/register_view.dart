import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmunch/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

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
        title: const Text('Register Page'),
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
                    final email = _email.text;
                    final password = _password.text;
                    try{
                      final user_credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                      devtools.log(user_credential.toString());
                    
                  } on FirebaseAuthException catch(e){
                      if(e.code == "weak-password"){
                        devtools.log('Weak Password');
                      }
                      else if(e.code == "email-already-in-use"){
                        devtools.log('Email Already in Use');
                      }
                      else if(e.code == "invalid-email"){
                        devtools.log('Invalid Email');
                      }
                      
                  }
                  },
                  child: const Text('Register'),        
                 
                ),
              TextButton(
              onPressed: (){ 
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login/',
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
