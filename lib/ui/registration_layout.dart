


import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';






//for radio button
int b =0;
 int s=0;
String ss= 'Student';
var radioValue;

//for blood group dropdown list
List<String> bloodGroup=<String>['O+','O-','A+','A-','B+','B-','AB+','AB-'];
String? dropdownBloodGroupValue;
var bloodGroupValue;

//for branch dropdown list
List<String> branch=<String>['CSE','AI/ML','Civil','other'];
String? dropdownBranchValue;
var branchValue;


//for year dropdown list
List<String> year=<String>['First','Second','Third','Forth',];
String? dropdownYearValue;
var yearValue;

//for year dropdown list
List<String> hostelerOrNot=<String>['Hosteler','Non Hosteler','Not Set'];
String? dropdownHostelValue;
var hostelerOrNotValue;

//for gender dropdown list
List<String> gender=<String>['Male','Female','other'];
String? dropdownGenderValue;
var genderValue;

//for blood Bank dropdown list
List<String> bloodBank=<String>['PGI','Red Cross','Not Set'];
 String? dropdownBloodBankValue;
 var bloodBankValue;

//for Gift dropdown list
List<String> gift=<String>['Yes','No'];
String? dropdowngiftValue;
var giftValue;


//variable for text fields
var nameValue;
var rollNoValue;
var contactNoValue;
var addressValue;





class RegistationLayout extends StatefulWidget {

  @override
  State<RegistationLayout> createState() => _RegistrationLayout();
}


class _RegistrationLayout extends State<RegistationLayout> {



  final databaseRef= FirebaseDatabase.instance.ref('Registration');


   //textEditingController
  final nameEditingController = TextEditingController();
  final rollNoEditingController= TextEditingController();
  final contactNoEditingController= TextEditingController();
  final addressEditingController= TextEditingController();



  //round button controlle
  final RoundedLoadingButtonController _btnController1 = RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController2 = RoundedLoadingButtonController();


  //init state
  @override
  void initState() {
    // TODO: implement initState
    nameEditingController.addListener(() => setState(() {}));
    rollNoEditingController.addListener(()=> {setState(() {})});
    contactNoEditingController.addListener(()=> {setState(() {})});
    addressEditingController.addListener(()=> {setState(() {})});

 }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text('Registration Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [

                SizedBox(height: 5,),
                //checkBox
                 Column(
                   children: [
                    Row(
                       children: [
                         SizedBox(width: 40,),
                         Text('Student'),
                         SizedBox(width: 10,),
                         Text('teaching'),
                         SizedBox(width: 10,),
                         Text('Non Teaching'),
                         SizedBox(width: 10,),
                         Text('Guest'),
                       ],
                     ),
                     Row(

                       children: [
                      SizedBox(height: 5,),
                      buildCheckBox(),

                        SizedBox(width: 5,),
                        ElevatedButton(
                        child: Text('Select'),
                        onPressed: (){fun();},
                      ),
                ],),
                   ],
                 ),

              SizedBox(height: 10,),


             if(s==1) Padding(
               padding: const EdgeInsets.all(8.0),
               child: buildStudent(),
             ),
             if(s==2 || s==3 || s==4)  Padding(
               padding: const EdgeInsets.all(8.0),
               child: buildOther(),
             ),

              if(s==1 && nameEditingController.text.isNotEmpty && rollNoEditingController.text.isNotEmpty && contactNoEditingController.text.isNotEmpty && addressEditingController.text.isNotEmpty && branchValue !=null && yearValue !=null && genderValue !=null && hostelerOrNotValue !=null && bloodGroupValue !=null && bloodBankValue != null && giftValue !=null)
               // ElevatedButton(onPressed: ()=>{setData()},child: Text('Submit'),) ,
                ElevatedButton(onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>  AlertDialog(
                  title: Text('Confirm Details'),
                  content: Text('make sure you have correctlly filled all the details!  $radioValue, $genderValue, $nameValue $bloodGroupValue, $bloodBankValue, $contactNoValue, $addressValue, + if student: $rollNoValue, $branchValue, $yearValue ,$hostelerOrNotValue'),
                  actions: [

                    TextButton(onPressed: () {setData(); Navigator.pop(context, true); }, child: Text('Yes')),
                    TextButton(onPressed: () { Navigator.pop(context, true); }, child: Text('No')),

                  ],
                ), ));}, child: Text('submit'),),

              if( (s==2 || s==3 || s==4) && nameEditingController.text.isNotEmpty && contactNoEditingController.text.isNotEmpty && addressEditingController.text.isNotEmpty &&  genderValue !=null && bloodGroupValue !=null && bloodBankValue != null && giftValue !=null)
                ElevatedButton(onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>  AlertDialog(
                  title: Text('Confirm Details'),
                  content: Text('make sure you have correctlly filled all the details! for person you selected "   $radioValue   ", , + if student:  $branchValue, $yearValue ,$hostelerOrNotValue etc.'),
                  actions: [

                    TextButton(onPressed: () {setData(); Navigator.pop(context, true); }, child: Text('Yes')),
                    TextButton(onPressed: () { Navigator.pop(context, true); }, child: Text('No')),

                  ],
                ), ));}, child: Text('submit'),),

            ],

          ),
        ),

      );
  }


  //******************************************************************   <<<widget functions>>>   ***************************************************************


//widget 1st radio button
  Widget buildCheckBox() {
    return Row(
      children: [
        SizedBox(width: 40,),
      // const Text('Student'),
        Radio(value: 1,
            groupValue: b,
            onChanged: (v) {onValueChange(v!);}
           ),
        SizedBox(width: 20,),

    //  const  Text('Teaching'),
        Radio(value: 2,
            groupValue: b,
            onChanged: (v) {onValueChange(v!);}),
        SizedBox(width: 20,),

     //  const Text('Non Teaching'),
        Radio(value: 3,
            groupValue: b,
            onChanged: (v) {onValueChange(v!);}),
        SizedBox(width: 20,),

    //  const Text('Guest'),
        Radio(value: 4,
            groupValue: b,
            onChanged: (v) {onValueChange(v!);}),


      ],
    );
  }



  //Widget Gender
 Widget buildGender() {
   return DropdownButton<String>(
     isExpanded: true,
     hint:const Text('Gender'),
     value: dropdownGenderValue,
     items: gender.map<DropdownMenuItem<String>>(
           (String value)
       {
         return DropdownMenuItem<String>
           (
           value: value,
           child: Text(value),
         );
       },
     ).toList(),
     onChanged: (String? newValue)
     {
       onValueChangeForGenderValue(newValue!);
     },
   );

 }



// Name widget
  Widget buildName() {
   // var nameEditingController = TextEditingController();
    return TextField(
      maxLines: 1,
      controller: nameEditingController,
      decoration: InputDecoration(
        hintText: 'Enter Name',
        labelText: 'Full Name',
        prefixIcon: nameEditingController.text.isEmpty
            ? Container(width: 0,)
            : IconButton(icon: Icon(Icons.close),
            onPressed: () => nameEditingController.clear()),
        border: OutlineInputBorder(),

      ),
      textInputAction: TextInputAction.done,


    );

  }


  // Widget buildContactNo
  Widget buildContactNo() {
   // var contactNoEditingController = TextEditingController();
    return TextField(
      keyboardType: TextInputType.number,
      maxLines: 1,
      maxLength: 10,
      controller: contactNoEditingController,
      decoration: InputDecoration(
        hintText: 'Contact Number',
        labelText: 'Contact Number',

        prefixIcon: contactNoEditingController.text.isEmpty
            ? Container(width: 0,)
            : IconButton(icon: Icon(Icons.close),
            onPressed: () => contactNoEditingController.clear()),
        border: OutlineInputBorder(),

      ),
      textInputAction: TextInputAction.done,


    );
  }




  //widget blood group
 Widget buildBloodGroup() {
    return DropdownButton<String>(
       isExpanded: true,
      hint:const Text('Select Blood Group'),
        value: dropdownBloodGroupValue,
        items: bloodGroup.map<DropdownMenuItem<String>>(
            (String value)
          {
              return DropdownMenuItem<String>
                (
                value: value,
                child: Text(value),
                );
            },
        ).toList(),
        onChanged: (String? newValue)
         {
          onValueChangeForBloodGroup(newValue!);
          },
       );
 }



// Widget buildBloodBank
 Widget buildBloodBank() {
   return DropdownButton<String>(
     isExpanded: true,
     hint:const Text(' Select Blood Bank'),
     value: dropdownBloodBankValue,
     items: bloodBank.map<DropdownMenuItem<String>>(
           (String value)
       {
         return DropdownMenuItem<String>
           (
           value: value,
           child: Text(value),
         );
       },
     ).toList(),
     onChanged: (String? newValue)
     {
       onValueChangeForBloodBankValue(newValue!);
     },
   );
 }



 //Widget Address
  Widget buildAddress() {
  //  var addressEditingController = TextEditingController();
    return TextField(

      controller: addressEditingController,
      decoration: InputDecoration(
        hintText: 'Enter Your Address',
        labelText: 'Full Address',

        prefixIcon: addressEditingController.text.isEmpty
            ? Container(width: 0,)
            : IconButton(icon: Icon(Icons.close),
            onPressed: () => addressEditingController.clear()),
        border:const OutlineInputBorder(),

      ),
      textInputAction: TextInputAction.done,
      maxLines: 1,

    );
  }


 //Widget gift receive
  Widget buildGiftReceived() {
    return DropdownButton<String>(
      isExpanded: true,
      hint:const Text(' Select Gift Received'),
      value: dropdowngiftValue,
      items: gift.map<DropdownMenuItem<String>>(
            (String value)
        {
          return DropdownMenuItem<String>
            (
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (String? newValue)
      {
        onValueChangeForGiftValue(newValue!);
      },
    );
  }









  //widget Roll number
  Widget buildRollNo() {

  //  var rollNoEditingController = TextEditingController();
    return TextField(
      keyboardType: TextInputType.number,
      maxLines: 1,
      controller: rollNoEditingController,
      decoration: InputDecoration(
        hintText: 'Roll Number',
        labelText: 'Roll Number',
        prefixIcon: rollNoEditingController.text.isEmpty
            ? Container(width: 0,)
            : IconButton(icon: Icon(Icons.close),
            onPressed: () => rollNoEditingController.clear()),
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.done,

    );

  }

  //widget branch
  Widget buildBranch() {
    return DropdownButton<String>(
      isExpanded: true,
      hint:const Text('Select Branch'),
      value: dropdownBranchValue,
      items: branch.map<DropdownMenuItem<String>>(
            (String value)
        {
          return DropdownMenuItem<String>
            (
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (String? newValue)
      {
        onValueChangeForBranchValue(newValue!);
      },
    );
  }




//widget year
  Widget buildYear() {
    return DropdownButton<String>(
      isExpanded: true,
      hint:const Text('Select Year'),
      value: dropdownYearValue,
      items: year.map<DropdownMenuItem<String>>(
            (String value)
        {
          return DropdownMenuItem<String>
            (
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (String? newValue)
      {
        onValueChangeForYearValue(newValue!);
      },
    );
  }




  //widget hosteler or non hosteler
  Widget buildHostelerNonHosteler() {
    return  DropdownButton<String>(
      isExpanded: true,
      hint:const Text('Select Hosteler or Non Hosteler'),
      value: dropdownHostelValue,
      items: hostelerOrNot.map<DropdownMenuItem<String>>(
            (String value)
        {
          return DropdownMenuItem<String>
            (
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (String? newValue)
      {
        onValueChangeForHostelerValue(newValue!);
      },
    );
  }





  //******************************************************************   <<< (student or not) widget functions>>>   ***************************************************************


  // for selecting weather it is student
  Widget buildStudent() {
    return Column(
      children: [
        SizedBox(height: 5,),
        buildGender(),
        SizedBox(height: 5,),
        buildName(),
        SizedBox(height: 5,),
        buildRollNo(),
        SizedBox(height: 5,),
        buildBranch(),
        SizedBox(height: 5,),
        buildYear(),
        SizedBox(height: 5,),
        buildHostelerNonHosteler(),
        SizedBox(height: 5,),
        buildBloodGroup(),
        SizedBox(height: 5,),
        buildBloodBank(),
        SizedBox(height: 5,),
        buildContactNo(),
        SizedBox(height: 5,),
        buildAddress(),
        SizedBox(height: 5,),
        buildGiftReceived(),
        SizedBox(height: 5,),
      ],
    );
  }


  // for selecting weather it is not a student
  Widget buildOther() {
    return Column(
      children: [
        SizedBox(height: 5,),
        buildGender(),
        SizedBox(height: 5,),
        buildName(),
        SizedBox(height: 5,),
        buildBloodGroup(),
        SizedBox(height: 5,),
        buildBloodBank(),
        SizedBox(height: 5,),
        buildContactNo(),
        SizedBox(height: 5,),
        buildAddress(),
        SizedBox(height: 5,),
        buildGiftReceived(),
        SizedBox(height: 5,),


      ],
    );
  }





//******************************************************************   <<< SET STATE and normal functions  >>>   ***************************************************************

//for 1st radio button (selecting student, teaching, non teaching, guest)
  void onValueChange(int a) {
    setState(() {
      b = a;
    });
  }
  void fun() {
    setState(() {
      if (b == 1) {
        s = 1;
        radioValue='Student';
      }
      else if (b == 2) {
        s = 2;
        radioValue='Teaching';
      }
      else if (b == 3) {
        s = 3;
        radioValue='Non Teaching';
      }
      else if (b == 4) {
        s = 4;
        radioValue='Guest';
      }
    });
  }

//on value change of blood group dropdown menu
  void onValueChangeForBloodGroup(String s) {

    setState(() {
      dropdownBloodGroupValue = s;
      bloodGroupValue=s;

    });
  }

  // on value change for branch value
  void onValueChangeForBranchValue(String s) {
    setState(() {
      dropdownBranchValue = s;
      branchValue=s;
    });
  }

  // on value change for year value
  void onValueChangeForYearValue(String s) {
    setState(() {
      dropdownYearValue = s;
      yearValue=s;
    });
  }

  // on value change for hostel value
  void onValueChangeForHostelerValue(String s) {
    setState(() {
      dropdownHostelValue = s;
      hostelerOrNotValue=s;
    });
  }

  // on value change for gender value
  void onValueChangeForGenderValue(String s) {
    setState(() {
      dropdownGenderValue = s;
      genderValue=s;
    });
  }

  // on value change for blood bank value
  void onValueChangeForBloodBankValue(String s) {
    setState(() {
      dropdownBloodBankValue = s;
      bloodBankValue=s;
    });
  }

  void onValueChangeForGiftValue(String s) {
    setState(() {
      dropdowngiftValue=s;
      giftValue=s;
    });
  }

  setData() {
    radioValue=radioValue.toString();
    genderValue=genderValue.toString();
    nameValue=nameEditingController.text.toString();
    rollNoValue=rollNoEditingController.text.toString();
    contactNoValue=contactNoEditingController.text.toString();
    addressValue=addressEditingController.text.toString();
    branchValue=branchValue.toString();
    yearValue=yearValue.toString();
    hostelerOrNotValue=hostelerOrNotValue.toString();
    giftValue=giftValue.toString();
    bloodGroupValue=bloodGroupValue.toString();
    bloodBankValue=bloodBankValue.toString();

    var id= DateTime.now().millisecondsSinceEpoch.toString();


    

    //adding data to firebase
  //  Navigator.push(context, MaterialPageRoute<void>(
    //  builder: (BuildContext context) {
  //      return DonerList(radioValue,genderValue,nameValue,rollNoValue,contactNoValue,addressValue,branchValue,yearValue,hostelerOrNotValue,bloodGroupValue,bloodBankValue,giftValue);

   //   }

   // ));

    databaseRef.child('$id').set({

      'id' : id,
      'Person': radioValue,
      'Gender': genderValue,
      'Name': nameValue,
      'Roll_no' : rollNoValue,
      'Branch' : branchValue,
      'Year' : yearValue,
      'Hosteler_or_Not' : hostelerOrNotValue,
      'Blood_Group' : bloodGroupValue,
      'Blood_Bank' : bloodBankValue,
      'Contact_no' : contactNoValue,
      'Address': addressValue,
      'Gift_Recive' : giftValue,

    })
        .then((value) => { _btnController1.success(), Fluttertoast.showToast(
                                                msg: "Data Inserted",
                                                toastLength: Toast.LENGTH_SHORT,
                                                 gravity: ToastGravity.BOTTOM,
                                                 timeInSecForIosWeb: 1,
                                                 backgroundColor: Colors.black87,
                                                 textColor: Colors.white,
                                                 fontSize: 16.0
         )})
           .onError((error, stackTrace) => {_btnController2.success(),Fluttertoast.showToast(
                                                 msg: "Something went wrong",
                                                 toastLength: Toast.LENGTH_SHORT,
                                                 gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                     backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                    fontSize: 16.0
             )});
    
    
   // Navigator.pop(context, true);
  }
//yearValue,hostelerOrNotValue,bloodGroupValue,bloodBankValue,giftValue









}

//radioValue,dropdownGenderValue,nameEditingController.text.toString(),rollNoEditingController.text.toString(),dropdownBranchValue,dropdownYearValue,dropdownHostelValue,dropdownBloodGroupValue,dropdownBloodBankValue,contactNoEditingController.text.toString(),addressEditingController.text.toString(),dropdowngiftValue




