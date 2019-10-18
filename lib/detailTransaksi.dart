import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bepsagent/profil.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'dashboard.dart' as dashboard;
import 'login.dart';
import 'var.dart';

class MyListTrx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp();
  }
}

class ListTrx extends StatefulWidget {
  @override
  _ListTrxState createState() => new _ListTrxState();
}

class _ListTrxState extends State<ListTrx> {
  List data;


  Future<Map<String, dynamic>> getTrx() async {
    setState(() {
      isLoading = true;
    });

    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    try {
      http.Response trxResponses =
          await ioClient.get(Uri.encodeFull(getTrxUrl()), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + access_token,
      });

      trxResponse = json.decode(trxResponses.body);
      print(trxResponse['content']);
      setState(() {
        isLoading = false;
        data = trxResponse['content'];
      });
    } catch (e) {
        isLoading = false;
      print("Fetch Data Failed");
    }
  }

  logout() {
    setState(() {
      access_token = null;
      merchantName = null;
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  void initState() {
    this.getTrx();
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset('$imgCashbac');
    return new Scaffold(
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
                      MaterialPageRoute(builder: (context) => dashboard.Dashboard()));
                },
              ),
              ListTile(
                title: Text('Profil'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profil()));
                },
              ),
              Container(
                color: Colors.blue[50],
                child: ListTile(
                  title: Text('List Transaksi'),
                  // onTap: () {
                  //   Navigator.pushReplacement(context,
                  //       MaterialPageRoute(builder: (context) => Dashboard()));
                  // },
                ),
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
        appBar: new AppBar(
          title: new Text('List Transaksi'),
        ),
        body: Container(
          child: Scrollbar(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, i) {
                      return Container(
                        color: Colors.grey[300],
                        child: Card(
                          child: ListTile(
                            leading: image,
                            title: Text(
                              'Time : ' +
                                  (data[i]['datetime']) +
                                  '\n'
                                      'Amount : ' +
                                  (data[i]['amount'].toString()) +
                                  '\n'
                                      'Method : ' +
                                  (data[i]['acqName']) +
                                  '',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 10),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new DetailTransaksi(data[i])));
                            },
                          ),
                        ),
                      );
                    }),
          ),
        ));
  }
}

class DetailTransaksi extends StatelessWidget {
  DetailTransaksi(this.data);
  final data;

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(title: new Text('Detail Transaksi')),
      body: new Column(children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            '$imgCashbacBig',
            width: 120,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(15),
            height: 400,
            width: 400,
            child: Text(
              'id : ' +
                  (data['id']) +
                  '\n'
                      'datetime : ' +
                  (data['datetime'].toString()) +
                  '\n'
                      'postDt : ' +
                  (data['postDt'].toString()) +
                  '\n'
                      'localTrxdt : ' +
                  (data['localTrxdt'].toString()) +
                  '\n'
                      'nii : ' +
                  (data['nii'].toString()) +
                  '\n'
                      'rrn : ' +
                  (data['rrn'].toString()) +
                  '\n'
                      'approvalCode : ' +
                  (data['approvalCode'].toString()) +
                  '\n'
                      'responseCode : ' +
                  (data['responseCode'].toString()) +
                  '\n'
                      'tid : ' +
                  (data['tid'].toString()) +
                  '\n'
                      'mid : ' +
                  (data['mid'].toString()) +
                  '\n'
                      'vtid : ' +
                  (data['vtid'].toString()) +
                  '\n'
                      'vmid : ' +
                  (data['vmid'].toString()) +
                  '\n'
                      'traceNum : ' +
                  (data['traceNum'].toString()) +
                  '\n'
                      'amountTip : ' +
                  (data['amountTip'].toString()) +
                  '\n'
                      'ip : ' +
                  (data['ip'].toString()) +
                  '\n'
                      'hostResponseCode : ' +
                  (data['hostResponseCode'].toString()) +
                  '\n'
                      'hostResponseMssg : ' +
                  (data['hostResponseMssg'].toString()) +
                  '\n'
                      'acquirerId : ' +
                  (data['acquirerId'].toString()) +
                  '\n'
                      'issuerId : ' +
                  (data['issuerId'].toString()) +
                  '\n'
                      'merchantName : ' +
                  (data['merchantName'].toString()) +
                  '\n'
                      'storeId : ' +
                  (data['storeId'].toString()) +
                  '\n'
                      'storeName : ' +
                  (data['storeName'].toString()) +
                  '\n'
                      'acqName : ' +
                  (data['acqName'].toString()) +
                  '\n'
                      'subProdName : ' +
                  (data['subProdName'].toString()) +
                  '\n'
                      'de62 : ' +
                  (data['de62'].toString()) +
                  '\n'
                      'de63 : ' +
                  (data['de63'].toString()) +
                  '\n'
                      'currencyId : ' +
                  (data['currencyId'].toString()) +
                  '\n'
                      'currencyName : ' +
                  (data['currencyName'].toString()) +
                  '\n'
                      'instName : ' +
                  (data['instName'].toString()) +
                  '\n',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
            ),
          ),
        )
      ]));
}
