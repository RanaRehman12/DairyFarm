import 'package:dairy_farmproject/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp>_initialization = Firebase.initializeApp();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          print ("Something went Wrong");
        }
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Email and Password',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: DairyFarm(),
        );
      },
    );
  }
}

