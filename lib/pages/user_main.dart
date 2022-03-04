import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'List_cattle.dart';
import 'add_cattle.dart';
import 'login.dart';
class UserMain extends StatefulWidget {
  const UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder:(context){
      return AlertDialog(

        title: Text("Milking Report",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black

            )
        ),

       content: Text('Daily Milk produce 500 Liter.                  '
           'One cow total milk produce 50 liters.'
         ,
           style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           color: Colors.black

       ),
       ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Close'),
            onPressed: (){
              Navigator.of(context).pop();

            },
          ),
        ],
      );
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        alignment:Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("DAIRY FARM",
              style: TextStyle(
                backgroundColor: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
            )
    ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 40.0),
              child: Image.asset("images/drttttt.png"

              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AddCattle();


                }));
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Add Cattle",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Cattlelist();
                }));

              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "View Cattle List",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                createAlertDialog(context);

              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Milk Report",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage(),),);
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );

  }
}
