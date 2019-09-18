import 'dart:convert';

import 'package:bepsagent/var.dart' as prefix0;
import 'package:flutter/material.dart';

import 'package:bepsagent/main.dart';
import 'package:bepsagent/var.dart';
import 'package:http/http.dart' as http;

//-----IMPORTS-------------------------------------------------------------------------------------------//

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  
}

String userInput = "";
String passwordInput = "Password Kosong";


class _LoginState extends State<Login> {

  Future<String> postDev() async {
    try {
      setState(() {
        userInput = userInput;
      });

      http.Response response = await http.post(Uri.encodeFull(loginUrl()),
          headers: {'Accept': 'application/json'}, body: json.encode({}));
      postDevResponse = json.decode(response.body);

      print(postDevResponse);
      // print('Access Token : ${postDevResponse['access_token']}');
      print('$userInput');
      print('$passwordInput');
    } catch (e) {
      print("No Connection to Om Hansen");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.grey[200],
              width: 300,
              child: TextField(
                onChanged: (usertext) {
                  userInput = usertext;
                },
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[400]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.grey[200],
              width: 300,
              child: TextField(
                onChanged: (text) {
                  passwordInput = text;
                },
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[400]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            height: 40,
            minWidth: 100,
            color: Colors.blue[100],
            onPressed: postDev,
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}

// {
//   Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => MyCrud()))
// },
