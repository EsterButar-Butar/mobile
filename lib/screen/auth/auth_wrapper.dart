import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/auth/login.dart';
import 'package:mobile/screen/auth/navbar.dart';
import 'package:mobile/screen/auth/login.dart';
import 'package:mobile/screen/auth/navbar.dart';

class AuthWrapper extends StatelessWidget{
  AuthWrapper({super.key});

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                )
            );
          }
          if(snapshot.hasData){
            return Navbar();
          }
          return LoginScreen();
        }
    );
  }
}