


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class DonerDetails extends StatelessWidget{

  var id;
  var radioValue;
  var gender;
  var name;
  var rollNo;
  var branch;
  var year;
  var hosteler;
  var bloodGroup;
  var bloodBank;
  var contactNo;
  var address;
  var gift;

  DonerDetails(this.id,this.radioValue,this.gender,this.name,this.rollNo,this.branch,this.year,this.hosteler,this.bloodGroup,this.bloodBank,this.contactNo,this.address,this.gift);


   final databaseRef= FirebaseDatabase.instance.ref('Registration');


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Doner Details'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Row(children: [ Text('Registration id:  '), Text('$id'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Person:  ',), Text('$radioValue'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Gender:  '), Text('$gender'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Name:  '), Text('$name'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Roll no:  '), Text('$rollNo'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Branch:  '), Text('$branch'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Year:  '), Text('$year'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Hosteler or Non Hosteler:  '), Text('$hosteler'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Blood Group:  '), Text('$bloodGroup'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Blood Bank:  '), Text('$bloodBank'),],),
          SizedBox(height: 10,),
          Row(children: [ Text('Contact no:  '), Text('$contactNo'),],),
          SizedBox(height: 10,),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: [ Text('Address:  '), Text('$address',),],)),
          SizedBox(height: 10,),
          Row(children: [ Text('Any Gift Recieve:  '), Text('$gift'),],),
          SizedBox(height: 100,),

          Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed:() {  databaseRef.child(id).update({'name': 'nameEditingController'});}, child: Icon(Icons.update),),
              SizedBox(width: 20,),
              ElevatedButton(onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>  AlertDialog(
                title: Text('Confirm Delete'),
                content: Text('Do you really wanna delete that whole perticular registration detail?'),
                actions: [
                  TextButton(onPressed: ()  { databaseRef.child(id).remove(); Navigator.pop(context, true);}, child: Text('Yes')),
                  TextButton(onPressed: () { Navigator.pop(context, true); }, child: Text('No'))
                ],
              ), ));}, child: Icon(Icons.delete)),
          ],),
        ],
      ),
    );
  }

  void onUpdate() {

  }


}

//databaseRef.child(id)