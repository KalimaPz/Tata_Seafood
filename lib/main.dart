import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sdm_mini_project/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('ERROR'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
