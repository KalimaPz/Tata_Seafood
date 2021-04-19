// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdm_mini_project/views/home.dart';

class Auth {
  FirebaseAuth auth;
  Auth() {
    auth = FirebaseAuth.instance;
  }
  signIn({String email, String password}) async {
    final response =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(response.user.email);
    return response.user;
  }

  signOut(BuildContext context) async {
    auth.signOut().whenComplete(() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        )));
  }

  get currentUser => auth.currentUser;
}
