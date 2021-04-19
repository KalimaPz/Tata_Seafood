import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth;
  Auth() {
    auth = FirebaseAuth.instance;
  }
  signIn({String email, String password}) async {
    final response =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    // print('token : ${response.credential.token}');
    print('user email : ${response.user.email}');
    print('user uid : ${response.user.uid}');
  }

  signOut() async {
    auth.signOut();
  }

  get currentUser => auth.currentUser;
}
