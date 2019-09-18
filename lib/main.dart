import 'dart:async';
import 'dart:convert';

import 'package:bepsagent/login.dart';
import 'package:bepsagent/var.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bepsagent/var.dart';
import 'package:bepsagent/login.dart';

//=================================================================================

void main() => runApp(MyCrud());
// var post = Post();

class MyCrud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BepsAgent Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Crud(title: 'Beps'),
    );
  }
}

class Crud extends StatefulWidget {
  Crud({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CrudState createState() => _CrudState();
}

//=================================================================================

class _CrudState extends State<Crud> {
  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'),
        headers: {'Accept': 'application/json'});
    getResponse = json.decode(response.body);

    // title = (data[1]['title']);
    print(getResponse[1]['title']);

    setState(() {
      getResponse = getResponse;
      title = (getResponse[1]['title']);
      body = (getResponse[1]);
    });
  }

//=================================================================================

  Future<String> postDev() async {
    try {
    http.Response response = await http.post(Uri.encodeFull(loginUrl()),
        headers: {'Accept': 'application/json'}, body: json.encode({}));
    postDevResponse = json.decode(response.body);

    print(postDevResponse);
    print('Access Token : ${postDevResponse['access_token']}');

      setState(() {
        postDevResponse = postDevResponse;
        access_token = '${postDevResponse['access_token']}';
        token_type = '${postDevResponse['token_type']}';
        refresh_token = '${postDevResponse['refresh_token']}';
        expires_in = '${postDevResponse['expires_in']}';
        scope = '${postDevResponse['scope']}';
        client_id = '${postDevResponse['client_id']}';
      });
    } catch (e) {
      print("No Connection to Om Hansen");
    }
  }

//=================================================================================

  Future<String> getDev() async {
    http.Response response =
        await http.get(Uri.encodeFull(searchUrl), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + access_token,
    });
    getDevResponse = json.decode(response.body);

    print(getDevResponse);
    print('${getDevResponse[0]['email']}');

    setState(() {
      getDevResponse = getDevResponse;
      email = '${getDevResponse[0]['email']}';
    });
  }

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
              onTap: () {},
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
        title: Text(widget.title),
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
                    "CRUD Test",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  MaterialButton(
                      height: 50,
                      minWidth: 100,
                      color: Colors.grey[100],
                      onPressed: getData,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Get Public",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      )),
                  MaterialButton(
                      height: 50,
                      minWidth: 100,
                      color: Colors.grey[100],
                      onPressed: postDev,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Post Dev",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      )),
                  MaterialButton(
                      height: 50,
                      minWidth: 100,
                      color: Colors.grey[100],
                      onPressed: getDev,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Get Dev",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 30,
                width: 400,
                color: Colors.blueGrey[50],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Get Public Response",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            Container(
                padding: new EdgeInsets.all(10.0),
                height: 100,
                width: 400,
                color: Colors.grey[100],
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "$getResponse",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ))),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 30,
                width: 400,
                color: Colors.blueGrey[50],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Post Dev Response",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            Container(
                padding: new EdgeInsets.all(10.0),
                height: 150,
                width: 400,
                color: Colors.grey[100],
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "host : " +
                            loginUrl() +
                            "\n\n"
                                "client_id : $client_id\n"
                                "access_token : $access_token\n"
                                "token_type : $token_type\n"
                                "refresh_token : $refresh_token\n"
                                "expires_in : $expires_in\n"
                                "scope : $scope\n"
                                "\nRaw :\n"
                                "$postDevResponse",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ))),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 30,
                width: 400,
                color: Colors.blueGrey[50],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Get Dev Response",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            Container(
                padding: new EdgeInsets.all(10.0),
                height: 150,
                width: 400,
                color: Colors.grey[100],
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "host : " +
                            searchUrl +
                            "\n\n"
                                "email : $email\n"
                                "\nRaw :\n"
                                "$getDevResponse",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
