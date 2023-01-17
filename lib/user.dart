import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';


class User extends StatelessWidget{
   User({super.key});
 TextEditingController ctr=TextEditingController();
 TextEditingController ctr1=TextEditingController();

  Future<dynamic> register(String email,String password,BuildContext context) async {

    // print("api calling");

    // print(email);
    // print(password);

    try {
      var result = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),);


      // print("output");
      // print(jsonDecode(result.body)['id']);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),);
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    Scaffold(
   body: Center(
     child: Column(
       children: [
        const  Text('User  Details',

         style: TextStyle(fontSize:20,)),
         const SizedBox(height: 15.0,),        Container(
           margin:const  EdgeInsets.only(left: 40.0,right: 40.0),
           child:TextField(controller: ctr,
             //Set text style
             style:const  TextStyle(
                 fontSize: 18
             ),
             keyboardType: TextInputType.emailAddress, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
             //Set decoration
             decoration:const  InputDecoration(
                 border: OutlineInputBorder(), //Create rounded outlined border
                 labelText: "Email", //Set the label text that will be shown over the border
                 prefixIcon: Icon(Icons.email), // Set email icon at the start of the TextField
                 hintText: "Enter your email ID"), // Set the hint text that will be shown when TextField is empty
           ),
         ),
         const SizedBox(height: 15.0,),
         Container(
           margin:const EdgeInsets.only(left: 40.0,right: 40.0),
           child: TextField(
             controller: ctr1,
             //Set text style
             style:const  TextStyle(
                 fontSize: 18
             ),
             keyboardType: TextInputType.emailAddress, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
             //Set decoration
             decoration: const InputDecoration(
                 border: OutlineInputBorder(), //Create rounded outlined border
                 labelText: "password", //Set the label text that will be shown over the border
                 prefixIcon: Icon(Icons.email), // Set email icon at the start of the TextField
                 hintText: "Enter password"), // Set the hint text that will be shown when TextField is empty
           ),
         ),
         const SizedBox(height: 15.0,),
         ElevatedButton(
             onPressed: (){
               register(ctr.text, ctr1.text,context);
               

             },
             child: const Text('Button'))
       ],
     ),
   ),


    );
  }

}