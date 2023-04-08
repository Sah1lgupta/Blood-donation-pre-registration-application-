import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:registration_app2/ui/doner_details.dart';
import 'package:registration_app2/ui/registration_layout.dart';




class RegistrationAdd extends StatefulWidget{
  const RegistrationAdd({super.key});





  @override
  State<StatefulWidget> createState() => _RegistrationAdd();



}

class _RegistrationAdd extends State<RegistrationAdd>{

  final ref=FirebaseDatabase.instance.ref('Registration');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
        automaticallyImplyLeading: false,
      ),



      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index){
               return ListTile( leading: Text('${index+1}'),trailing:Text(snapshot.child('Blood_Group').value.toString()),title: Text(snapshot.child('Name').value.toString()), subtitle: Text(snapshot.child('Contact_no').value.toString()), onTap: () {navigatingToDetailPage(snapshot.child('id').value.toString(),snapshot.child('Person').value.toString(),snapshot.child('Gender').value.toString(),snapshot.child('Name').value.toString(),snapshot.child('Roll_no').value.toString(),snapshot.child('Branch').value.toString(),snapshot.child('Year').value.toString(),snapshot.child('Hosteler_or_Not').value.toString(),snapshot.child('Blood_Group').value.toString(),snapshot.child('Blood_Bank').value.toString(),snapshot.child('Contact_no').value.toString(),snapshot.child('Address').value.toString(),snapshot.child('Gift_Recive').value.toString(),);},);
            }),
          ),
        ],
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistationLayout() ));},
        child: Icon(Icons.add),
      ),




    );
  }

  void navigatingToDetailPage(String string, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10, String string11, String string12, String string13) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> DonerDetails(string,string2,string3,string4,string5,string6,string7,string8,string9,string10,string11,string12,string13) ));
  }







}



//  var arrList=['a','s','c','d'];

//  ListView.separated(   itemBuilder: (context, index){return ListTile( leading: Text('${index +1}'), title: Text('${arrList[index]}'), subtitle: Text('subtitle'), trailing: Icon(Icons.cancel), onTap: ()=> onTapp(index.toString()), );},      itemCount: arrList.length,    scrollDirection: Axis.vertical,      separatorBuilder: (context, index){ return Divider(height: 4,thickness: 3,);},),


// onTapp(String value) {
//     print('$value');
//   }

//Address
// :
// "fthgr"
// Blood_Bank
// :
// "PGI"
// Blood_Group
// :
// "O+"
// Branch
// :
// "null"
// Contact_no
// :
// "2546226545"
// Gender
// :
// "Male"
// Gift_Recive
// :
// "Bag"
// Hosteler_or_Not
// :
// "null"
// Name
// :
// "dvl"
// Person
// :
// "Non Teaching"
// Roll_no
// :
// ""
// Year
// :
// "null"