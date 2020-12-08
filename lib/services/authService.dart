import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_ambulance_app/screens/home_page.dart';
import 'package:hospital_ambulance_app/screens/loginScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  String uid;
  checkAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginScreen();
          }
        });
  }

  Future<void> signinWithEmail(
      String email, String password, BuildContext context) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    });
  }
}
