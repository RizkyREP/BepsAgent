import 'dart:convert';
import 'package:bepsagent/dashboard.dart';
import 'package:bepsagent/var.dart';
import 'package:bepsagent/var.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'package:bepsagent/Service.dart';
import 'package:bepsagent/main.dart';
import 'package:bepsagent/var.dart';
import 'package:http/http.dart' as http;

//-----IMPORTS-------------------------------------------------------------------------------------------//

class MyCrud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BepsAgent Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

String userInput = "";
String passwordInput = "";
bool isVisible = false;

class _LoginState extends State<Login> {
  Future<String> login() async {
    try {
      setState(() {
        userInput = userInput;
        passwordInput = passwordInput;
      });

      http.Response response = await http.post(Uri.encodeFull(loginUrl()),
          headers: {'Accept': 'application/json'}, body: json.encode({}));
      postDevResponse = json.decode(response.body);

      print(postDevResponse);
      print('Access Token : ${postDevResponse['access_token']}');
      print('$userInput');
      print('$passwordInput');
      access_token = '${postDevResponse['access_token']}';

      http.Response responseGet =
          await http.get(Uri.encodeFull(userInfoUrl()), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + access_token,
      });
      getResponse = json.decode(responseGet.body);
      getDevResponse = getResponse;
      print(getResponse[0]['email']);
      setState(() {
        email = (getResponse[0]['email']);
        username = (getResponse[0]['username']);
        merchantId = (getResponse[0]['merchantId']);
      });

      if (getResponse[0]['email'] != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    } catch (e) {
      print("No Connection to Om Hansen");
    }
  }

  // Future<String> getuserInfo() async {
  //   http.Response response =
  //       await http.get(Uri.encodeFull(userInfoUrl()), headers: {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ' + access_token,
  //   });
  //   getResponse = json.decode(response.body);
  //   setState(() {
  //     getDevResponse = getResponse;
  //   });
  //   print(getResponse[1]['email']);
  // }

  //------------------------------------------------------------------------------------------------------//

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
                controller: TextEditingController()..text = '$userInput',
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
                obscureText: true,
                // controller: TextEditingController()..text = '$passwordInput',
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
            height: 10,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            height: 40,
            minWidth: 100,
            color: Colors.blue[100],
            onPressed: login,
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
