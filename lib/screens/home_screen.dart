import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "http://10.0.2.2:3000";

  String str = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(str),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            http
                .post(
              url,
              body:
                  {"username" : "username", "password" : "pass"},
            )
                .then((value) {
              setState(() {
                // print(value.body);
                Map<String, dynamic> t = json.decode(value.body.toString());
                str = t['name'];
              });
            }).catchError(() {
              setState(() {
                str = 'Error!';
              });
            });
          },
        ),
      ),
    );
  }
}
