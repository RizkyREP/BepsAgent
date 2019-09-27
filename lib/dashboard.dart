import 'dart:convert';
import 'dart:io';

import 'package:bepsagent/login.dart';
import 'package:bepsagent/var.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bepsagent/login.dart';
import 'package:bepsagent/profil.dart';
import 'package:http/io_client.dart';

import 'list.dart';

//=================================================================================

class MyDashboard extends StatelessWidget {
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
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  logout() {
    setState(() {
      access_token = null;
      merchantName = null;
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  getTrx() async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    http.Response trxResponses =
        await ioClient.get(Uri.encodeFull(getTrxUrl()), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + access_token,
    });

    trxResponse = json.decode(trxResponses.body);
    print(trxResponse['content'][0]['id']);
    setState(() {
      data = trxResponse['content'][0]['id'];
    });
  }

  bool btnSummary = true;
  bool btnTrx = false;
  
  void _button1() {
    setState(() {
      btnSummary = true;
      btnTrx = false;
    });
  }

  void _button2() {
    setState(() {
      btnSummary = false;
      btnTrx = true;
    });
  }

  List data;
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
            Container(
              color: Colors.blue[50],
              child: ListTile(
                title: Text('Dashboard'),
                // onTap: () {
                //   Navigator.pushReplacement(
                //       context, MaterialPageRoute(builder: (context) => Profil()));
                // },
              ),
            ),
            ListTile(
              title: Text('Profil'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Profil()));
              },
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
        title: Text('Dashboard'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Row(children: <Widget>[
            Container(
              width: 180,
              height: 50,
              child: FlatButton(
                  child: Text(
                    "Summary",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  color: btnSummary ? Colors.blue[400] : Colors.blue,
                  onPressed: () => _button1()
                  ),
            ),
            Container(
              width: 180,
              height: 50,
              child: FlatButton(
                  child: Text(
                    "Transaction",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  color: btnTrx ? Colors.blue[400] : Colors.blue,
                  onPressed: () => _button2()
                  ),
            ),
          ]),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  // MaterialButton(
                  //     height: 50,
                  //     minWidth: 350,
                  //     color: Colors.grey[100],
                  //     onPressed: getTrx,
                  //     child: Align(
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "Get Trx Data",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.normal, fontSize: 15),
                  //       ),
                  //     )),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
