import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget {
  const Home({super.key});


  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    return jsonDecode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
   return  FutureBuilder(
       future: fetchUsers(),
       builder: (BuildContext context, AsyncSnapshot snapshot) {
         if (snapshot.hasData) {
           return ListView.builder(
             itemCount: snapshot.data.length,
             itemBuilder: (BuildContext context, int index) {
               return Card(
                 child: ListTile(
                   title: Text(snapshot.data[index]['first_name'] +
                       " " +
                       snapshot.data[index]['last_name'] 
                       ),
                   // trailing:
                   // Text(snapshot.data[index]['dob']['age'].toString()),
                   leading: CircleAvatar(
                     backgroundImage: NetworkImage(
                       snapshot.data[index]['avatar'],
                     ),
                   ),
                   subtitle: Text(snapshot.data[index]['email']),
                 ),
               );
             },
           );
         } else {
           return const Center(
             child:  CircularProgressIndicator(),
           );
         }
       },
     );
   }


  }
