import 'dart:convert';
import 'dart:io';
import 'package:bepsagent/var.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:bepsagent/login.dart';
import 'package:bepsagent/var.dart';
import 'package:bepsagent/graph.dart' as graph;
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;
import 'package:bepsagent/profil.dart';
import 'package:http/io_client.dart';

import 'graph.dart';
import 'detailTransaksi.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

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
  @override
  void initState() {
    this.getTrx();
  }

  dashboardLogout() {
    endSession();
    // print('$access_token');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  Future<Map<String, dynamic>> getTrx() async {
    dataMap.putIfAbsent("LinkAja", () => 1);
    dataMap.putIfAbsent("BepsPay", () => 5);
    dataMap.putIfAbsent("GOPAY", () => 2);
    dataMap.putIfAbsent("Wechat", () => 3);
    dataMap.putIfAbsent("OVO", () => 4);

    setState(() {
      isLoading = true;
    });

//=================================================================================

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

//=================================================================================

 Map<String, double> dataMap = new Map();

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

  DateTime _currentDate;
  var image = Image.asset('$imgCashbac');
  var _markedDateMap;

//=================================================================================

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: 80,
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Profil()));
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
                        dashboardLogout();
                      },
                    ),
                  ],
                ),
              ),

              //=======================================================================================================================

              appBar: AppBar(
                title: Text('Dashboard'),
                bottom: TabBar(
                  tabs: [
                    Tab(text: ('Summary')),
                    Tab(text: ('Transaction')),
                    // Tab(text: ('Test 3')),
                  ],
                ),
              ),

              //=======================================================================================================================

              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // SizedBox(height: 30),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          color: Colors.white,
                          child: Container(
                            height: 120,
                            //width: 400,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text('Profit Today',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                          )),
                                    ),
                                    Sparkline(
                                      data: dummyGraph1,
                                      lineColor: Colors.blue[50],
                                      pointsMode: PointsMode.none,
                                      pointColor: Colors.red[100],
                                      pointSize: 2.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 40),
                                      alignment: Alignment.center,
                                      child: Text('Rp. 100,000',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 2,
                                color: Colors.white,
                                child: Container(
                                  height: 80,
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  child: Stack(
                                    children: <Widget>[
                                      Sparkline(
                                        data: dummyGraph1,
                                        lineColor: Colors.blue[50],
                                        pointsMode: PointsMode.none,
                                        pointColor: Colors.red[100],
                                        pointSize: 2.0,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text('Transaction\nToday',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                            )),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(top: 25),
                                        child: Text('72',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 2,
                                color: Colors.white,
                                child: Container(
                                  height: 80,
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  child: Stack(
                                    children: <Widget>[
                                      Sparkline(
                                        data: dummyGraph2,
                                        lineColor: Colors.blue[50],
                                        pointsMode: PointsMode.none,
                                        pointColor: Colors.red[100],
                                        pointSize: 2.0,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Transaction\nThis Week',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(top: 25),
                                        child: Text('240',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 2,
                                color: Colors.white,
                                child: Container(
                                  height: 80,
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  child: Stack(
                                    children: <Widget>[
                                      Sparkline(
                                        data: dummyGraph1,
                                        lineColor: Colors.blue[50],
                                        pointsMode: PointsMode.none,
                                        pointColor: Colors.red[100],
                                        pointSize: 2.0,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text('Transaction\nThis Month',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                            )),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(top: 25),
                                        child: Text('9999+',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                         Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: PieChart(
                            dataMap: dataMap,
                            animationDuration: Duration(milliseconds: 1000),
                            chartValuesColor: Colors.black.withOpacity(0.5),
                            legendFontColor: Colors.grey[600],
                          ),
                         ),
                      ],
                    ),
                  ),

//=======================================================================================================================

                  Scrollbar(
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        :
                        ListView.builder(
                            itemCount: reversedData == null ? 0 : reversedData.length,
                            itemBuilder: (BuildContext context, i) {
                              return Container(
                                color: Colors.grey[200],
                                child: Card(
                                  margin: EdgeInsets.all(2),
                                  child: ListTile(
                                    leading: Image.asset(
                                      '$imgCashbac',
                                      height: 30,
                                    ),
                                    title: Text(
                                      'Time : ' +
                                          (reversedData[i]['postDt']) +
                                          '\n'
                                              'Amount : ' +
                                          (reversedData[i]['amount'].toString()) +
                                          '\n'
                                              'Method : ' +
                                          (reversedData [i]['acqName']) +
                                          '',
                                      
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 9),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new DetailTransaksi(
                                                      reversedData[i])));
                                    },
                                  ),
                                ),
                              );
                            }),
                  ),
                ],
              ),
            )));
  }
}
