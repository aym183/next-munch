import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextmunch/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nextmunch/views/register_view.dart';

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
    return Column(
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
                    final user_credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                    print(user_credential);
                  
                } on FirebaseAuthException catch(e){
                    print(e.code);
                    print('Something Bad Happened');
                }
                },
                child: const Text('Login'),        
               
              ),

            TextButton(onPressed: (){ RegisterView();} , child: const Text('Not Registered Yet? Register Here!')),

          ],
          );
  }
}
