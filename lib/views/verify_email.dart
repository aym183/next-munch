import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nextmunch/constants/routes.dart';
import 'package:nextmunch/views/login_view.dart';

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
            Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (route) => false,
                    );

          }, child: const Text('Send email verification'))
        ],
        ); 

  }
}