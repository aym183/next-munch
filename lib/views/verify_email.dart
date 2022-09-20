import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/login_view.dart';
import 'dart:developer' as devtools show log;

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    devtools.log(user.toString());
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(children: [
          const Text('Verification link has been sent to Email. Please verify your email address: '),
          TextButton(onPressed: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
                    homeRoute,
                    (route) => false,
          );
          },
                    
          child: const Text('Completed'),
          ),
        ],
    ),
    );
  }
}