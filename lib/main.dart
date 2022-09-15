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
    ),
    );
}

//stl -> shortcut widget
//stf

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        
      ),
      body: FutureBuilder(
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
      ),
      
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
          const Text('Please verify your email address: '),
          TextButton(onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();

          }, child: const Text('Send email verification'))
        ],
        ); 

  }
}