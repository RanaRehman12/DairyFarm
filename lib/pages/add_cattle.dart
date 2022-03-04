import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddCattle extends StatefulWidget {
  const AddCattle({Key? key}) : super(key: key);

  @override
  _AddCattleState createState() => _AddCattleState();
}

class _AddCattleState extends State<AddCattle> {

  var Tag= " ";
  var obtain = " ";
  var Gender = " ";
  var Breed = " ";
  var Item = " ";

  final db1 = FirebaseDatabase.instance.reference().child("Cattles");

  TextEditingController TagController=TextEditingController();
  TextEditingController obtainController=TextEditingController();
  TextEditingController BreedController=TextEditingController();
  int groupValue = 0;

  String? cowDownValue="Cow";
  var cowitems=["Cow","Heifers","Bulls","Calves"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('Add Cattle',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 30,right: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all( 15.0,),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tag',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                        ),
                        controller: TagController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Radio(
                            value: 0,
                            groupValue: groupValue,

                            focusColor: Colors.white,
                            // checkColor: Colors.white,
                            onChanged: handleRadio,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14,left: 10,right: 30,bottom: 10),
                          child: Text('Male',style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5,left: 10,),
                          child: Radio(
                            value: 1,
                            groupValue: groupValue,
                            onChanged: handleRadio,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14,left: 10,right: 30,bottom: 10),
                          child: Text('Female',style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),//
                    Container(
                      width: 300,
                      height:50,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(left: 20, right:170,top: 30,bottom:20),
                      decoration: BoxDecoration(
                        border: Border.all(color:Colors.black),
                        borderRadius: BorderRadius.circular(12),
                        color:Colors.white,
                      ),
                      child: DropdownButton(
                        value: cowDownValue,
                        items:cowitems.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(items)
                          );
                        }
                        ).toList(),
                        onChanged: (newValue){
                          setState(() {
                            cowDownValue = newValue as String?;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all( 15.0,),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Breed',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                        ),
                        controller: BreedController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'Please Enter Value';
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
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Obtained',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                        ),
                        controller: obtainController,
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
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


                     Tag = TagController.text;
                     Breed = BreedController.text;
                     obtain = obtainController.text;

                     if(groupValue==0){
                       Gender= "Male";
                     }
                     else if(groupValue==1){
                       Gender = "Female";
                     }
                db1.push().set({
                'TAG':Tag,'Gender':Gender,'Item':cowDownValue,'Breed':Breed,'Obtain':obtain
                });



              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "Add",
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

  void handleRadio(int? value) {
    setState(() {
      groupValue = value!;
    });

  }
}
