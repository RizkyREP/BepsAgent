import 'package:bepsagent/login.dart';
import 'package:bepsagent/var.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bepsagent/login.dart';


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
  // Dashboard({Key key}) : super(key: key);
  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Dashboard> {
  
  logout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
    access_token = null;
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
              title: Text('Logout'),
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
                padding: const EdgeInsets.only(left: 8.0, top: 10),
                height: 90,
                width: 400,
                color: Colors.grey[100],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Username : $username\n"
                    "Email : $email\n",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                )),
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
                    "Merchant Data",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(left: 8.0, top: 10),
                height: 90,
                width: 400,
                color: Colors.grey[100],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Merchant ID : $merchantId\n"
                    "Merchant Name : $merchantName\n",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                )),
            Container(
                height: 30,
                width: 400,
                color: Colors.blueGrey[50],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Store List",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                )),
            Container(
                padding: const EdgeInsets.only(left: 8.0, top: 10),
                height: 90,
                width: 400,
                color: Colors.grey[100],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Store 1 = ",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
