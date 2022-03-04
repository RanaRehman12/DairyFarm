import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
class Cattlelist extends StatefulWidget {
  const Cattlelist({Key? key}) : super(key: key);

  @override
  _CattlelistState createState() => _CattlelistState();
}

class _CattlelistState extends State<Cattlelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text("Cattle list",style: TextStyle(
                backgroundColor: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Image.asset("images/drttttt.png"),
          ),
           Flexible(
            child: FirebaseAnimatedList(
              shrinkWrap: true,
                query: FirebaseDatabase.instance
                    .reference().child("Cattles"),
                    //.orderByChild("TAG"),
                    //.equalTo("1"),
                padding:EdgeInsets.only(top: 20),
                reverse: false,
                itemBuilder: (_, DataSnapshot snapshot,
                    Animation<double> animation, int x) {
                  return Container(
                    margin:  EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                    color: Colors.grey,

                    child: SizedBox(
                      height: 90,
                      child: ListTile(
                        title:Text("CATTLES" ,style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),),
                        subtitle:Text(snapshot.value.toString(),style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),


    );
  }
}






