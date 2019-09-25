import 'dart:convert';
import 'dart:io';
import 'package:bepsagent/dashboard.dart';
import 'package:bepsagent/var.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'package:bepsagent/Service.dart';
import 'package:bepsagent/main.dart';
import 'package:bepsagent/var.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:ssl_pinning_plugin/ssl_pinning_plugin.dart';

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

bool isVisible = false;

class _LoginState extends State<Login> {
  Future<String> login() async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    try {
      setState(() {
        isLoading = true;
        userInput = userInput;
        passwordInput = passwordInput;
      });

      http.Response response = await ioClient.post(Uri.encodeFull(loginUrl()),
          headers: {'Accept': 'application/json'}, body: json.encode({}));
      postDevResponse = json.decode(response.body);

      print(postDevResponse);
      print('Access Token : ${postDevResponse['access_token']}');
      print('$userInput');
      print('$passwordInput');
      access_token = '${postDevResponse['access_token']}';

      http.Response responseGetUserInfo =
          await ioClient.get(Uri.encodeFull(userInfoUrl()), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + access_token,
      });
      getResponse = json.decode(responseGetUserInfo.body);
      getDevResponse = getResponse;
      print(getResponse[0]['email']);
      if (getResponse[0]['merchantId'] != null) {
        setState(() {
          email = (getResponse[0]['email']);
          username = (getResponse[0]['username']);
          merchantId = (getResponse[0]['merchantId']);
        });
      } else {
        merchantId = "Tidak memiliki merchant";
      }

      http.Response responseGetMerchantInfo =
          await ioClient.get(Uri.encodeFull(merchantInfoUrl()), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + access_token,
      });
      getMerchantResponse = json.decode(responseGetMerchantInfo.body);
      getMerchantResponse = getMerchantResponse;
      print(getMerchantResponse[0]['name']);
      if (getMerchantResponse[0]['name'] != null) {
        setState(() {
          merchantName = (getMerchantResponse[0]['name']);
        });
      } else {
        merchantName = "Tidak memiliki merchant";
      }

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to connect to Host");
    }
  }


  //------------------------------------------------------------------------------------------------------//

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                        controller: TextEditingController()..text = username,
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
      ),
    );
  }
}
