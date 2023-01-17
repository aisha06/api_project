import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Pdf extends StatelessWidget{

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse("https://api.ocr.space/parse/imageurl?apikey=helloworld&url=https://www.africau.edu/images/default/sample.pdf"));
    return jsonDecode(result.body)['ParsedResults'];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title:  Text("parsed Text"+snapshot.data[index]['ParsedText']
                  ),
                  // trailing:
                  // Text(snapshot.data[index]['dob']['age'].toString()),

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


