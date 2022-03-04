import 'package:dairy_farmproject/pages/signup.dart';
import 'package:dairy_farmproject/pages/user_main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  
  final _formkey = GlobalKey<FormState>();
  
  var email = " ";
  var password = " ";
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Signin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> UserMain(),),);

    }on FirebaseAuthException catch(error){
      if(error.code=='user not found'){
        print('No user found for that email');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text('No user found for that email',
          style: TextStyle(fontSize: 18.0,color: Colors.amber),),
        ),
        );
      }
      else if(error.code=='Worng Password'){
        print('Worng Password provided by the user');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text('Worng Password provided by the user',
            style: TextStyle(fontSize: 18.0,color: Colors.amber),),
        ),
        );
      }

    }
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.only(top: 50,left: 30 , right: 30),
          child: ListView(
            children: [
              Padding(padding: const EdgeInsets.all(8.0),
              child:Image.asset("images/login.jpg"),
              ),
              Container(
                margin: EdgeInsets.all( 15.0,),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                  ),
                  controller: emailController,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please Enter Email';
                    }
                    else if(!value.contains('@')){
                      return 'Please enter valid email';
                    }
                      return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all( 15.0,),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                  ),
                  controller: passwordController,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all( 8.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()){
                        setState(() {
                          email = emailController.text;
                          password = passwordController.text;
                        });
                        Signin();
                      }
                    },
                        child: Text(
                          'SignIn',
                          style: TextStyle(fontSize: 18.0),
                        ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                            'Forgotten Password ?',
                            style: TextStyle(fontSize: 12.0),
                          ),
                     ),

                  ],
                ),

              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do not have an account ?'),
                    TextButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder:(context,a,b)=>Signup(), transitionDuration: Duration(seconds: 0) ),(route) => false);
                    },
                        child: Text(
                          'Signup'
                        ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
