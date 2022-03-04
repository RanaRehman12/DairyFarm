import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatefulWidget {


  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  final db = FirebaseDatabase.instance.reference().child("Users");




  var fullname = " ";
  var lastname = " ";
  var email = " ";
  var password = " ";
  var confirmPassword = " ";

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  final fullnameController= TextEditingController();
  final lastnameController= TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  registration() async{
    if(password==confirmPassword){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text('Registered Successfully, Please Sign in',
            style: TextStyle(fontSize: 20.0,color: Colors.amber),),
        ),
        );
        db.push().set({'Full Name':fullname,'Last Name':lastname,'Email':email,'Password':password});
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage(),),);



      }on FirebaseAuthException catch(error){
        if(error.code=='weak-password'){
          print (' Password is too weak ');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(' Password is too weak ',
              style: TextStyle(fontSize: 20.0,color: Colors.amber),),
          ),
          );

        }
        else if(error.code=='email-already-in-use'){
          print(' Account is already exist ');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(' Account is already exist ',
              style: TextStyle(fontSize: 20.0,color: Colors.amber),),
          ),
          );


        }

    }
    }
    else{
      print(' Password and Confirm password does not match ');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueGrey,
        content: Text(' Password and Confirm password does not match ',
          style: TextStyle(fontSize: 20.0,color: Colors.amber),),
      ),
      );
    }

  }
  void _adduser(){


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
    backgroundColor: Colors.white,
        body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.only(top: 20,left: 30 , right: 30),
    child: ListView(
    children: [
    Padding(padding: const EdgeInsets.all(8.0),
    child:Image.asset("images/signup.png"),
     ),
      Container(
        margin: EdgeInsets.all( 15.0,),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            labelText: 'Full Name:',
            labelStyle: TextStyle(fontSize: 20.0),
            border: OutlineInputBorder(),
            errorStyle: TextStyle(color: Colors.black26,
              fontSize: 15.0,),
          ),
          controller: fullnameController,
          validator: (value){
            if(value==null||value.isEmpty){
              return 'Please Enter Full Name';
            }
            return null;
          },

        ),
      ),
      Container(
        margin: EdgeInsets.all( 15.0,),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            labelText: 'Last Name',
            labelStyle: TextStyle(fontSize: 20.0),
            border: OutlineInputBorder(),
            errorStyle: TextStyle(color: Colors.black26,
              fontSize: 15.0,),
          ),
          controller: lastnameController,
          validator: (value){
            if(value==null||value.isEmpty){
              return 'Please Enter Last Name';
            }

            return null;
          },
        ),
      ),
          Container(
              margin: EdgeInsets.all( 15.0,),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Email:',
                labelStyle: TextStyle(fontSize: 20.0),
                border: OutlineInputBorder(),
                errorStyle: TextStyle(color: Colors.black26,
                  fontSize: 15.0,),
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
            errorStyle: TextStyle(color: Colors.black26,
              fontSize: 15,),
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
        margin: EdgeInsets.all( 15.0,),
        child: TextFormField(
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            labelStyle: TextStyle(fontSize: 20.0),
            border: OutlineInputBorder(),
            errorStyle: TextStyle(color: Colors.black26,
              fontSize: 15,),
          ),
          controller: confirmPasswordController,
          validator: (value){
            if(value==null||value.isEmpty){
              return 'Please confirm Password';
            }
            return null;
          },
        ),
      ),

      SizedBox(height: 15,),


      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
                setState(() {
                  fullname =  fullnameController.text;
                  lastname =  lastnameController.text;
                  email = emailController.text;
                  password = passwordController.text;
                  confirmPassword = confirmPasswordController.text;
                });
                registration();
              }

            },
                child: Text('SignUp',
                style: TextStyle(fontSize: 18.0
                ),
                ),
            ),
          ],
        ),
      ),

      SizedBox(height: 15,),

      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account ?'),
            TextButton(onPressed: (){
             Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,animation1,animation2)=>LoginPage(),
             transitionDuration: Duration(seconds: 0),),);
            },
                child: Text('signIn'),),
          ],
        ),
      ),


    ],
    ),
    ),
        ),


    );
  }
}
