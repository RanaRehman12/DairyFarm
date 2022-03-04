
import 'package:flutter/material.dart';

import 'login.dart';
class DairyFarm extends StatelessWidget {
  const DairyFarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key,}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginPage(),
        ),
            (route) => false,//if you want to disable back feature set to false
      );
    });
    return Scaffold(
        body: Center(
            child: Image.asset(
                "images/splash.png",
                fit: BoxFit.cover
            )
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

