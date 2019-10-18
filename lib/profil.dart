import 'package:bepsagent/dashboard.dart';
import 'package:bepsagent/login.dart';
import 'package:bepsagent/var.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bepsagent/login.dart';

import 'detailTransaksi.dart';

//=================================================================================

class MyProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  logout() {
    setState(() {
      access_token = null;
      merchantName = null;
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
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
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            Container(
              color: Colors.blue[50],
              child: ListTile(
                title: Text('Profil'),
                // onTap: () {
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => Dashboard()));
                // },
              ),
            ),
            ListTile(
              title: Text('List Transaksi'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ListTrx()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),

//=================================================================================

      appBar: AppBar(
        title: Text('Profil'),
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
          ],
        ),
      ),
    );
  }
}
