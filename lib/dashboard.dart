import 'dart:async';
import 'dart:convert';

import 'package:bepsagent/login.dart';
import 'package:bepsagent/var.dart';
import 'package:bepsagent/var.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bepsagent/login.dart';
import 'package:bepsagent/Service.dart';
import 'package:bepsagent/main.dart';

//=================================================================================

class MyCrud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BepsAgent Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);
  // final String title;

  @override
  _CrudState createState() => _CrudState();
}

//=================================================================================

class _CrudState extends State<Dashboard> {
//=================================================================================

  // Future<String> postDev() async {
  //   try {
  //   http.Response response = await http.post(Uri.encodeFull(loginUrl()),
  //       headers: {'Accept': 'application/json'}, body: json.encode({}));
  //   postDevResponse = json.decode(response.body);

  //   print(postDevResponse);
  //   print('Access Token : ${postDevResponse['access_token']}');

  //     setState(() {
  //       postDevResponse = postDevResponse;
  //       access_token = '${postDevResponse['access_token']}';
  //       token_type = '${postDevResponse['token_type']}';
  //       refresh_token = '${postDevResponse['refresh_token']}';
  //       expires_in = '${postDevResponse['expires_in']}';
  //       scope = '${postDevResponse['scope']}';
  //       client_id = '${postDevResponse['client_id']}';
  //     });
  //   } catch (e) {
  //     print("No Connection to Om Hansen");
  //   }
  // }

//=================================================================================

  // Future<String> getDev() async {
  //   http.Response response =
  //       await http.get(Uri.encodeFull(searchUrl()), headers: {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ' + access_token,
  //   });
  //   getDevResponse = json.decode(response.body);

  //   print(getDevResponse);
  //   print('${getDevResponse[0]['email']}');

  //   // setState(() {
  //   //   getDevResponse = getDevResponse;
  //   //   email = '${getDevResponse[0]['email']}';
  //   // });
  // }

//=================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 90,
              child: DrawerHeader(
                child: Text(
                  'Menu Bepsnet',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Crud'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Crud()));
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),

//=================================================================================

      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
                height: 30,
                width: 400,
                color: Colors.blueGrey[50],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "User Data",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 10
                  ),
                height: 90,
                width: 400,
                color: Colors.grey[100],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Username = $username\n"
                    "Email = $email\n"
                    "Merchant ID = $merchantId",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
          ],
        ),
      ),
    );
  }
}
